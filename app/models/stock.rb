class Stock < ApplicationRecord

  has_many :user_stocks
  has_many :users, through: :user_stocks



  def checkTotalStocks(user, stock, account)
    qty = stock.total_quantity.to_i
    if qty === 0
      user.stocks.find(stock.id).destroy
    end
  end


end
