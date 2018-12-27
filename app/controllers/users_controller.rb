class UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def create
      @user = User.create(createUserParams)
      if @user.valid?
        token= JWT.encode({user_id: @user.id}, '')
        render json: {user: @user, jwt: token}
      else
        render json: {error: "WRONG"},status: 422
      end

  end

private

def createUserParams
  params.require(:user).permit(:first_name,:last_name,:house_number,:street_name,:city,:state,:zipcode,:date_of_birth,:username,:password,:email)
end

end
