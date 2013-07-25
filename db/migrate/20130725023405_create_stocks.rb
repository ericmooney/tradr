class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.integer :quantity
      t.float :starting_price
      t.references :user

      t.timestamps
    end
    add_index :stocks, :user_id
  end
end
