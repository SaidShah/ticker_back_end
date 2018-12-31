class StocksController < ApplicationController
  def update
    @user = User.find(new_stock_values[:user_id])
    @stock = @user.stocks.find(new_stock_values[:stock_id])
    @account = @user.account
    @stock.total_quantity = new_stock_values[:new_stock_count]
    @stock.total_value = new_stock_values[:new_value_for_stock]
    @account.total_funds = new_stock_values[:new_account_balance]
    @stock.save
    @account.save
    @user.save

    updatedUser={
      person: @user,
      stocks: @user.stocks,
      account: @user.account
    }
    render json: updatedUser
  end

  def create
    @user = User.find(create_stock[:user_id])
    @newStock = Stock.create(symbol: create_stock[:symbol],total_quantity: create_stock[:quantity], total_value: create_stock[:total_value], purchase_price: create_stock[:purchase_price])
    UserStock.create(user_id: create_stock[:user_id], stock_id: @newStock.id)
    render json: @user
    
  end


private

  def new_stock_values
    params.require(:values).permit(:total_value, :new_stock_count, :new_account_balance, :new_value_for_stock, :stock_id, :user_id)
  end

  def create_stock
    params.require(:values).permit(:total_value, :total_funds, :symbol, :user_id, :quantity, :purchase_price)
  end

end
