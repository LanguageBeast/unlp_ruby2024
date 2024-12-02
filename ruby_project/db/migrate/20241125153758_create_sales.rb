class CreateSales < ActiveRecord::Migration[8.0]
  def change
    create_table :sales do |t|
      t.decimal :total_amount, precision: 10, scale: 2
      t.integer :client_id

      t.timestamps
    end
  end
end
