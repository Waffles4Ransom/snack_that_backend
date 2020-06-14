class Api::V1::SnacksController < ApplicationController

  def index 
    snacks = Snack.all 
    render json: snacks
  end 

end
