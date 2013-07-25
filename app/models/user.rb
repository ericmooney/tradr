class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :email, :password, :password_confirmation, :cash

  has_many :stocks

  validates_length_of :password, :minimum => 3, :message => "password must be at least 3 characters long", :if => :password
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password
  validates_uniqueness_of :email

  def stock_profit(stock)
    paid_initially = stock.starting_price

    latest_value_of_shares = stock.latest_price
    (latest_value_of_shares.to_f - paid_initially.to_f) * stock.quantity
  end
end
