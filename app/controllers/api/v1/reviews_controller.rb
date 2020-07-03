class Api::V1::ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :update, :destroy]
  before_action :set_snack, only: [:index, :create]

  def index
    @reviews = @snack.reviews.all
    render json: @reviews
  end

  def create 
    review = @snack.reviews.build(review_params)
    if review.save 
      render json: {message: "Success!"} 
    else
      render json: {error: review.errors.full_messages.to_sentence }, status: 400
    end 
  end 

  def destroy
    @review.destroy
  end 

  private 

  def review_params 
    params.require(:review).permit(:content, :rating, :user_id)
  end

  def set_snack
    @snack = Snack.find(params[:snack_id])
  end 

  def set_review 
    @review = Review.find_by(id: params[:id])
  end 

end
