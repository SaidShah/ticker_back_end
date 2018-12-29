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
      id: current_user.id,
      user_name: current_user.username,
      email: current_user.email,
      first_name: current_user.first_name,
      last_name: current_user.last_name,
      house_number: current_user.house_number,
      street_name: current_user.street_name,
      city: current_user.city,
      state: current_user.state,
      zipcode: current_user.zipcode,
      date_of_birth: current_user.date_of_birth,
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
