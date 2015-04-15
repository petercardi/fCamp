require 'pry'

class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :current_user
  before_action :set_restaurant, only: [:show, :edit, :new, :create, :update, :destroy]
  before_action :ensure_current_user, except: [:index, :show]

  def index
    @restaurants = Restaurant.all.order("LOWER(name)")
    @reviews = Review.all
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
    # set_review
    @rcomment = @review.rcomments.new
  end

  def edit

  end

  def update
    @review.update(review_params)
    redirect_to reviews_path, notice: "Review was successfully updated"
  end

  def destroy
    @review.destroy
    redirect_to reviews_path, notice: "Review was successfully deleted"
  end

private

  def review_params
    params.require(:review).permit(:header, :rating, :body)
  end

  def set_restaurant
    if params[:restaurant_id]
      @restaurant = Restaurant.find(params[:restaurant_id])
    else
      @restaurant = @review.restaurant
    end
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def rcomment_params
    params.require(:rcomment).permit(:comment).merge(user: current_user)
  end

  def ensure_current_user
    unless current_user
      redirect_to sign_in_path
      flash[:error] = "You must be signed in to do that, yo!"
    end
  end

end
