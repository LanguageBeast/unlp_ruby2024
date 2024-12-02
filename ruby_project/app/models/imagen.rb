class Imagen < ApplicationRecord
  belongs_to :producto
  has_one_attached :image_data
end
