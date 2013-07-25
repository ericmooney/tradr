class Stock < ActiveRecord::Base
  belongs_to :user
  attr_accessible :quantity, :starting_price, :symbol, :user_id

  before_create :set_starting_price

   def set_starting_price
     # quote = StockQuote::Stock.quote(symbol)
     # self.starting_price = quote.last

     quote = Ystock.get_stock(symbol).first[1]
     self.starting_price = quote[:price]
   end

   def latest_price
    # quote = StockQuote::Stock.quote(symbol)
    # quote.last

    quote = Ystock.get_stock(symbol).first[1]
    quote[:price]
   end



end
