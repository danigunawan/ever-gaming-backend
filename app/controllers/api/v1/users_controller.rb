class Api::V1::UsersController < ApplicationController

  def index
    render json: User.all
  end

  # def new
  #   @user = User.new(user_params)
  #   if @user.valid?
  #     @user.save
  # end

  def profile
    #if the front end has a token, we send back to @user
    token = request.headers['Authentication'].split(' ')[1]
    payload = decode(token)
    current_user = User.find(payload["user"])
    render json: { user: current_user }, status: :accepted
  end


  #Sign Up
  def create
    @user = User.create(user_params)
    if @user.valid?
      render json: {user: User.new(@user)}, status: :created
    else
      render json: {message: 'failed to create user'}, status: :not_acceptable
    end
  end

  def show
    render json: User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
