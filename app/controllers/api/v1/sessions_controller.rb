class Api::V1::SessionsController < ApplicationController

  def create 
    # binding.pry
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      render json: @user, except: [:password_digest, :updated_at]
    else
      render json: {error: "Invalid attempt, please try again."}
    end
  end 

  def get_current_user 

  end 

  def destroy
    session.clear
    render json: {message: "logged out"}
  end 


end
