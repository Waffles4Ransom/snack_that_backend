class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end 

  def create
    @user = User.new(user_params)
    @user.profile_photo = 'https://i.imgur.com/I2c2B2s.png' if @user.profile_photo == ''
    if @user.save 
      session[:user_id] = @user.id
      render json: @user
    else
      render json: { errors: @user.errors.full_messages.to_sentence }
    end
  end 

  private 

  def user_params 
    params.require(:user).permit(:username, :password, :name, :location, :profile_photo)
  end 

end
