class Api::V1::ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :update, :destroy]
  before_action :set_snack, only: [:create]

  def index
    @reviews = Review.all
    render json: @reviews
  end

  def show 
    render json: @review.to_json(:include => { 
      :user => {:only => [:username]},
      :snack => {:except => [:created_at, :updated_at, :snack_id]}
      }, :except => [:created_at, :updated_at])
  end 

  def create 
    review = @snack.reviews.build(review_params)
    if review.save 
      render json: {message: "Success!"} 
    else
      render json: {errors: review.errors.full_messages.to_sentence }
    end 
  end 

  def update

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
