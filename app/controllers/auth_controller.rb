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
    
    current_user =  User.find(JWT.decode(request.authorization,"SECRET")[0]["user_id"])
     render json: {user: current_user, jwt: request.authorization}
    # if current_user
    #   render json: {user: current_user}
    # else
    #   render json: {error: "error"},status: 422
    # end
  end

  private

  def userParams
    params.require(:user).permit(:username,:password)
  end

end
