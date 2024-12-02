class RenameProductoColumns < ActiveRecord::Migration[8.0]
  def change
    rename_column :productos, :nombre, :name
    rename_column :productos, :descripcion, :description
    rename_column :productos, :precio_unitario, :unit_price
    rename_column :productos, :stock_disponible, :available_stock
    rename_column :productos, :categoria, :category
    rename_column :productos, :fecha_ingreso, :entry_date
    rename_column :productos, :fecha_ultima_modificacion, :last_modification_date
    rename_column :productos, :fecha_baja, :deactivation_date
    rename_column :productos, :talle, :size
  end
end
