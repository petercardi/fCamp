class RcommentsController < ApplicationController

  before_action do
    @review = Review.find(params[:review_id])
  end

  def index
    @rcomments = Rcomment.all
  end

  def create
    @restaurant = Restaurant.find(@review.restaurant_id)
    @rcomment = @review.rcomments.new(rcomment_params)
    @rcomment.save
    redirect_to restaurant_review_path(@restaurant, @review), notice: "comment was successfully created"
  end

  def destroy
    Rcomment.find(params[:id]).destroy
    redirect_to restaurant_review_path(@restaurant, review), notice: "comment was successfully deleted"
  end

private

  def rcomment_params
    params.require(:rcomment).permit(:comment).merge(user_id: current_user.id)
  end

end
