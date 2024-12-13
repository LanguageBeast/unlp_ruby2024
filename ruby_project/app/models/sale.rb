class Sale < ApplicationRecord
  attr_accessor :products_chosen, :products_db

  has_many :sale_products, dependent: :destroy
  has_many :products, through: :sale_products

  # irrelevant
  # validates :total_amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :client_id, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validate :must_have_at_least_one_product_and_correct_amount, on: :create

  before_update :restock_products, if: :will_save_change_to_deleted_at?

  scope :active, -> { where(deleted_at: nil) }

  def destroy
    update(deleted_at: Time.current)
  end

  def deleted?
    deleted_at.present?
  end

  private

  def restock_products
    sale_products.each do |sale_product|
      product = sale_product.product
      if product.deactivation_date != nil
        product.available_stock += sale_product.amount
        product.save!(validate: false)
      end
    end
  end

  def must_have_at_least_one_product_and_correct_amount
    # first, I check there's at least one product in the array
    if products_chosen.nil? || products_chosen.empty?
      errors.add(:base, "At least one product must be sold")
    end

    # then, for each product, I check the amount sold is correct
    products_chosen.each do |product_id, amount|
      if amount.to_i <= 0
        errors.add(:base, "The amount sold must be greater than 0")
      end
      if amount.to_i > products_db[product_id.to_i]
        errors.add(:base, "The amount sold exceeds the available stock for product #{Producto.find(product_id).name}")
      end
    end
  end
end
