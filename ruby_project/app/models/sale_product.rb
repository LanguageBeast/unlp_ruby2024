class SaleProduct < ApplicationRecord
  belongs_to :sale
  belongs_to :product, class_name: "Producto"

  validates :amount, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :amount_less_than_or_equal_to_product_stock

  private

  def amount_less_than_or_equal_to_product_stock
    if amount > product.available_stock
      errors.add(:amount, "must be less than or equal to the product's available stock")
    end
  end
end
