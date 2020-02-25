class CitiesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @city = City.new
  end

  def all_cities
    @cities = City.all
    render :index
  end

  def destroy
    @city=City.find(params[:id])
    if @city.user_id != current_user&.id
      flash[:notice] = "Thats Not Your City"
      return redirect_to root_path
    end
    @city.delete

    flash[:notice] = "City Deleted"
    redirect_to root_path
  end  

  def index
    @delete_btn= true
    @cities = user_signed_in? ? current_user.cities : City.all
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
