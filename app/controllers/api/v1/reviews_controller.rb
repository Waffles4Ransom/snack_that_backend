class Api::V1::ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :update, :destroy]

  def index
    @reviews = Review.all
    render json: @reviews
  end

  def show 
    render json: @review.to_json(:include => { :snack => {:except => [:created_at, :updated_at, :snack_id]}}, :except => [:created_at, :updated_at])
  end 

  def create 
    review = Review.new(review_params)
    if review.save 
      render json: review 
    else
      render json: {errors: review.errors.full_messages }
    end 
  end 

  def update

  end 

  def destroy 
    @review.destroy
  end 

  private 

  def review_params 

  end

  def set_review 
    @review = Review.find_by(id: params[:id])
  end 

end
