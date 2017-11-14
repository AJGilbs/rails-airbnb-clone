class FoodToursController < ApplicationController
  before_action :set_food_tour, only: [:show, :edit, :update]

  def index
    @food_tours = FoodTour.all
  end

  def show
  end

  def new
    @food_tour = FoodTour.new
  end

  def create
    @food_tour = FoodTour.new(food_tour_params)
    @food_tour.user_id = current_user.id
    if @food_tour.save
      redirect_to food_tour_path(@food_tour)
    else
      render 'new'
    end
  end

  def update
    @food_tour.update(food_tour_params)
    redirect_to food_tour_path
  end

  def edit
  end

  private

  def set_food_tour
    @food_tour = FoodTour.find(params[:id])
  end

  def food_tour_params
    params.require(:food_tour).permit(:title, :description, :city, :price, :dates, :cuisine, :photo, :photo_cache)
  end
end

