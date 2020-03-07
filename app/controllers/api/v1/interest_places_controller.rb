class Api::V1::InterestPlacesController < ApplicationController
  before_action :set_interest_place, only: [:update, :destroy]

  def index
    @interest_places = InterestPlace.order(:name)
    render json: @interest_places
  end

  def create
    @interest_place = InterestPlace.new(interest_place_params)

    if @interest_place.save
      render json: @interest_place, status: :created
    else
      render json: @interest_place.errors, status: :unprocessable_entity
    end
  end

  def update
    if @interest_place.update(interest_place_params)
      render json: @interest_place, status: :ok
    else
      render json: @interest_place.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @interest_place.destroy

    render json: @interest_place
  end

  private

  def interest_place_params
    params.require(:interest_place).permit(:name, :x, :y, :opened, :closed)
  end

  def set_interest_place
    @interest_place = InterestPlace.find(params[:id])
  end
end
