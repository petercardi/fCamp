class RestaurantsController < ApplicationController
  # before_action :set_user, only: [:new, :create, :update, :destroy]
  before_action :ensure_current_user, except: [:index, :show]

  helper_method :avg_rating

  def index
    @restaurants = Restaurant.all.order("LOWER(name)")
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to restaurants_path, notice: "Restaurant profile was successfully created."
    else
      flash[:notice] = "Restaurant could not be saved"
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

    if @restaurant.update(restaurant_params)
      redirect_to restaurants_path, notice: "Restaurant profile was successfully updated."
    else
      render :edit
    end

  end

  def destroy
    Restaurant.find(params[:id]).destroy
    redirect_to restaurants_path, notice: "Restaurant was successfully burned to the ground. Fire Department investigators are currently probing for signs of arson and preparing to take any necessary actions. Your IP address has been logged, your FaceTime camera activated, and geolocation sequence initiated."
  end

private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :hours, :website, :description, :quick, :vegetarian, :vegan, :beer, :wine, :full_bar, :price_range)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def ensure_current_user
    unless current_user
      redirect_to sign_in_path
      flash[:error] = "You must be signed in to do that, yo!"
    end
  end

end
