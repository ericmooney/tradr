class AddCashToUser < ActiveRecord::Migration
  def change
    add_column :users, :cash, :float
  end
end
