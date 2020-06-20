class Api::V1::UsersController < ApplicationController

  def index
    users = User.all
    # render json: users, except: [:updated_at, :password_digest]
    render json: users.to_json(:include => { :reviews => {:except => [:created_at, :updated_at, :user_id]}}, :except => [:password_digest, :updated_at])

  end 

  def show
    user = User.find_by(id: params[:id])
    render json: user, only: [:name, :username, :location, :profile_photo], include: :snacks
  end 

  def create
    @user = User.new(user_params)
    if @user.save 
      # log_in(@user)
      render json: @user, only: [:username, :name, :location, :profile_photo]
    else
      render json: { errors: user.errors.full_messages }
    end
  end 

  def update

  end 

  private 

  def user_params 
    params.require(:user).permit(:username, :password_digest, :name, :location, :profile_photo)
  end 

end
