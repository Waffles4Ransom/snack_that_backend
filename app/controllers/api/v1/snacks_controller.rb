class Api::V1::SnacksController < ApplicationController
  before_action :set_snack, only: [:show, :update, :destroy]

  def index 
    snacks = Snack.all 
    render json: snacks, except: [:created_at, :updated_at]
  end 

  def show 
    # render json: @snack, except: [:created_at, :updated_at], include: :reviews
    render json: @snack.to_json(:include => { :reviews => {:except => [:created_at, :updated_at, :snack_id]}}, :except => [:created_at, :updated_at])
  end 
  
  def create
    @snack = Snack.new(snack_params)
    @snack.status = 'undecided'
    if @snack.save 
      render json: @snack
    else
      render json: {error: 'Snack not saved!'}
    end
  end 

  def update

  end 
  
  def destroy 
    @snack.destroy
  end 
  
  private 
  
  def snack_params
    params.require(:snack).permit(:name, :description, :origin, :image, :categories)
  end 
  
  def set_snack 
    @snack = Snack.find_by(id: params[:id])
  end

end
