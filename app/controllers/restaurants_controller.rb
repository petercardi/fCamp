class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    restaurant_params = params.require(:restaurant).permit(:name, :address, :phone_number, :hours, :website, :description)
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to restaurants_path, notice: "Restaurant profile was successfully created."
    else
      render :new
    end

  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    restaurant_params = params.require(:restaurant).permit(:name, :address, :phone_number, :hours, :website, :description)
    @restaurant.update(restaurant_params)
    redirect_to restaurants_path, notice: "Restaurant profile was successfully updated."
  end

  def destroy
    Restaurant.find(params[:id]).destroy
    redirect_to restaurants_path, notice: "Restaurant was successfully burned to the ground. Fire Department investigators are currently probing for signs of arson and preparing to take any necessary actions. Your IP address has been logged, your FaceTime camera activated, and geolocation sequence initiated."
  end

private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :hours, :website, :description)
  end

end
