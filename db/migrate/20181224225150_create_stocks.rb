class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.string :total_quantity
      t.string :total_value
      t.string :purchase_price

      t.timestamps
    end
  end
end
