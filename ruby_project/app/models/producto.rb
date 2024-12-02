class Producto < ApplicationRecord
  before_create :set_last_modification_date
  before_save :set_last_modification_date

  has_many_attached :images, dependent: :destroy
  has_many :sale_products
  has_many :sales, through: :sale_products

  validates :name, presence: { message: "is required" }, length: { in: 10..100, message: "must be between 10 and 100 characters" }
  validates :description, presence: { message: "is required" }, length: { in: 10..100, message: "must be between 10 and 100 characters" }
  validates :unit_price, presence: { message: "is required" }, numericality: { only_integer: true, greater_than: 0, message: "must be greater than 0" }
  validates :available_stock, presence: { message: "is required" }, numericality: { only_integer: true }
  validates :category, presence: { message: "is required" }
  validates :entry_date, presence: { message: "is required" }
  validate :validate_entry_date
  validate :must_have_at_least_one_image, on: :create

  def eliminar
    self.stock_disponible = 0
    self.fecha_baja = Date.today
    save
  end

  private

  def set_entry_date
    self.entry_date = Date.today
  end

  def set_last_modification_date
    self.last_modification_date = Date.today
  end

  def validate_entry_date
    if entry_date.present? && entry_date > Date.today
      errors.add(:entry_date, "cannot be in the future")
    end
  end

  def must_have_at_least_one_image
    if images.blank?
      errors.add(:images, "must have at least one image")
    end
  end
end
