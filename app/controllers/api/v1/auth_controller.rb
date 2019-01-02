class Api::V1::AuthController < ApplicationController
  # skip_before_action :authorized, only: [:create]

  def create #POST api/v1/login
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      #setting up payload to encode from the fetch call on front end
      payload = { user: @user.id }
      token = encode(payload)

      #send back a JWT token
      render json: {
        message: 'correct username and password',
        token: token,
        error: false,
        user: {
          username: @user.username,
        }
        },
        status: :accepted
    else
      render json: {
        message: 'incorrect username or password',
        error: true,
        },
        status: :unauthorized
    end
  end

  private
  #
  # def user_login_params
  #   # params { user: {username: 'Chandler Bing', password: 'hi' } }
  #   params.require(:user).permit(:username, :password)
  # end

end
