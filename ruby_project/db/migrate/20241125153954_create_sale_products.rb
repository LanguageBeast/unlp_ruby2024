class CreateSaleProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :sale_products do |t|
      t.references :sale, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: { to_table: :productos }
      t.integer :amount
      t.decimal :total_amount, precision: 10, scale: 2

      t.timestamps
    end
  end
end
