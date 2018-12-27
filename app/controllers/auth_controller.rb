class AuthController < ApplicationController

  def create

    user = User.find_by(username: userParams[:username])
    if user && user.authenticate(userParams[:password])
      token = JWT.encode({user_id: user.id}, "SECRET")
      render json: {user: user, jwt: token}
      
    else
      render json: {error: "wrong username or password"},status: 400
    end
  end

  def show
    if current_user
      render json: {user: current_user}
    else
      render json: {error: "error"},status: 422
    end
  end

  private

  def userParams
    params.require(:login).permit(:username,:password)
  end

end
