class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end 

  def show
    @user = User.find_by(id: params[:id])
    render json: @user
  end 

  def create
    @user = User.new(user_params)
    if @user.profile_photo == ''
      @user.profile_photo = 'https://i.imgur.com/Zuj9qA7.png'
    end
    if @user.save 
      session[:user_id] = @user.id
      render json: @user
    else
      render json: { errors: @user.errors.full_messages.to_sentence }
    end
  end 

  def update

  end 

  private 

  def user_params 
    params.require(:user).permit(:username, :password, :name, :location, :profile_photo)
  end 

end
