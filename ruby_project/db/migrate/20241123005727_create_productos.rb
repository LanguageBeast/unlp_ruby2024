class CreateProductos < ActiveRecord::Migration[8.0]
  def change
    create_table :productos do |t|
      t.string :nombre
      t.text :descripcion
      t.decimal :precio_unitario
      t.integer :stock_disponible
      t.text :imagenes
      t.string :categoria
      t.string :talle
      t.string :color
      t.date :fecha_ingreso
      t.date :fecha_ultima_modificacion
      t.date :fecha_baja

      t.timestamps
    end
  end
end
