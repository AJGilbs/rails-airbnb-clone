class ReviewsController < ApplicationController
  def create
    @food_tour = FoodTour.find(params[:food_tour_id])
    @review = Review.new(review_params)
    @review.food_tour = @food_tour
    @review.save

    authorize @review
  end


private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end


