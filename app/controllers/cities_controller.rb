class CitiesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @city = City.new
  end

  def index
    @cities = City.all
  end

  def show
    @city = City.find(params[:id])
  end

  def create
    current_user.cities.create(city_params)
    redirect_to root_path
  end

  private

  def city_params
    params.require(:city).permit(:name, :state)
  end  
end