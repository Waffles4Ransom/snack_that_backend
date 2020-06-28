class Api::V1::SnacksController < ApplicationController
  before_action :set_snack, only: [:show, :update, :destroy]

  def index 
    snacks = Snack.all.chrono_order
    # render json: snacks, include: 'users', except: [:created_at, :updated_at]
    # render json: snacks.to_json(:include => { 
    #   :users => {:only => :username},
    #   :reviews => {:except => [:created_at, :updated_at, :snack_id]}
    #   }, :except => [:created_at, :updated_at])
   
    render json: snacks.as_json(:include => {
      :reviews => {:except => [:created_at, :updated_at, :snack_id], :include => :user}
      }, :except => [:created_at, :updated_at])
  end 

  def show
    # render json: @snack, except: [:created_at, :updated_at], include: :reviews
    render json: @snack.to_json(:include => { :reviews => {:except => [:created_at, :updated_at, :snack_id]}, :users => { :only => [:username]}}, :except => [:created_at, :updated_at])
  end 
  
  def create
    @snack = Snack.new(snack_params)
    @snack.status = 'undecided' if @snack 
    if @snack.save 
      render json: @snack.to_json(:include => { :reviews => {:except => [:created_at, :updated_at, :snack_id]}, :users => { :only => [:username]}}, :except => [:created_at, :updated_at])
    else
      # render json: {error: 'Snack not saved!'}, status: 400
      render json: {error: @snack.errors.full_messages}, status: 400
    end
  end 

  def update

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
