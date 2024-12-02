class RemoveImagenesFromProductos < ActiveRecord::Migration[8.0]
  def change
    remove_column :productos, :imagenes, :text
  end
end
