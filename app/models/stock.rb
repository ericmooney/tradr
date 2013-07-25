class Stock < ActiveRecord::Base
  belongs_to :user
  attr_accessible :quantity, :starting_price, :symbol, :user_id
end
