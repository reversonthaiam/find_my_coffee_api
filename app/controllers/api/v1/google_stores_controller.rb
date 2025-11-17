class Api::V1::GoogleStoresController < ApplicationController
  def index
    places = GetGoogleCoffeeListService.new(params[:latitude], params[:longitude]).call
    render json: places
  end

  def show
    place_details = GetGoogleCoffeeDetailsService.new(params[:id]).call
    render json: place_details
  end
end
