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


private

  def new_stock_values
    params.require(:values).permit(:total_value, :new_stock_count, :new_account_balance, :new_value_for_stock, :stock_id, :user_id)
  end

end
