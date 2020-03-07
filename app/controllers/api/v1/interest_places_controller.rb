class Api::V1::InterestPlacesController < ApplicationController
  before_action :set_interest_place, only: %i[update destroy]

  def search
    return params_search_message if params_correct?

    @query = QueryGenerator.call(params[:search])

    render json: @query
  end

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

  def search_params
    params.require(:search).permit(:x, :y, :mts, :hr)
  end

  def set_interest_place
    @interest_place = InterestPlace.find(params[:id])
  end

  def params_correct?
    needed_keys = %i[x y mts hr]

    needed_keys.map do |key|
      search_params.include?(key)
    end.include?(false)
  end

  def params_search_message
    render json: "Search params is incorrect, it must be like: { x: 1, y: 2, mts: 10, hr: '12:00' }",
      status: :unprocessable_entity
  end
end
