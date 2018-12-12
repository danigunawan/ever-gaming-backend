class UsersController < ApplicationController

  def index
    render json: User.all
  end

  def new
    @user = User.new(user_params)
    if @user.valid?
      @user.save
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      render json: {message: 'correct username and password'}, status: :accepted
    else
      render json: {message: 'incorrect username or password'}, status: :unauthorized
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
