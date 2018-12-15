class Api::V1::AuthController < ApplicationController

  def create #POST api/v1/login
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])

      # payload = { user: @user.id }
      # token = encode(payload)

      #send back a JWT token
      render json: {
        message: 'correct username and password'},
        # token: token,
        # error: false,
        # user: {
        #   username: @user.username,
        # }
        # },
        status: :accepted
    else
      render json: {
        message: 'incorrect username or password'},
        # error: true,
        # },
        status: :unauthorized
    end
  end

end
