class Api::V1::SnacksController < ApplicationController
  before_action :set_snack, only: [:show, :update, :destroy]

  def index 
    snacks = Snack.most_recent
    render json: snacks
  end 
  
  def create
    @snack = Snack.new(snack_params)
    @snack.status = 'undecided' if @snack 
    if @snack.save 
      render json: @snack
    else
      render json: {error: @snack.errors.full_messages.to_sentence}, status: 400
    end
  end 
  
  def destroy 
    @snack.destroy
  end 
  
  private 
  
  def snack_params
    params.require(:snack).permit(:name, :description, :origin, :image, :categories => [])
  end 
  
  def set_snack 
    @snack = Snack.find_by(id: params[:id])
  end

end
