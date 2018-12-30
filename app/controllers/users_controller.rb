class UsersController < ApplicationController

  def index
    render json: User.includes(:account, :stocks), include: ["account", "stocks"]
  end

  def show
    
  end

  def create
      @user = User.create(createUserParams)

      if @user.valid?
        token= JWT.encode({user_id: @user.id}, 'SECRET')
        Account.create(user_id: @user.id, total_funds: "10000")
        @newUser = {user: @user, account: @user.account, stocks: @user.stocks}
        render json: {user: @newUser, jwt: token}

      else
        render json: {error: "WRONG"},status: 422
      end

  end

private

def createUserParams
  params.require(:user).permit(:first_name,:last_name,:house_number,:street_name,:city,:state,:zipcode,:date_of_birth,:username,:password,:email)
end

end
