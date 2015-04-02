class ReviewsController < ApplicationController
  before_action :set_restaurant

  def index
    @restaurants = Restaurant.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = @restaurant.reviews.new(review_params)

    if @review.save
      redirect_to reviews_path, notice: "Review was successfully created"
    else
      render :new
    end

  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to reviews_path, notice: "Review was successfully updated"
  end

  def destroy
    review.find(params[:id]).destroy
    redirect_to reviews_path, notice: "Review was successfully deleted"
  end

private

  def review_params
    params.require(:task).permit(:header, :rating, :body)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

end
