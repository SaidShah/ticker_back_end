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
    user= {
      person: current_user,
      account: current_user.account,
      stocks: current_user.stocks
    }
      render json: {user: user, jwt: request.authorization}

  end

  private

  def userParams
    params.require(:user).permit(:username,:password)
  end

end
