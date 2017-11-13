class BookingsController < ApplicationController
  before_action :set_food_tour, only: [ :create ]

  def edit
   @booking = Booking.find(params[:id])
  end

  def update
   @booking.update
   redirect_to root_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @food_tour = @booking.food_tour
    @food_tour.destroy
   redirect_to root_path
  end

  def create
     @booking = Booking.new()
     @booking.food_tour = @food_tour
     if @booking.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  # def booking_params
  #   params.require(:booking).permit()
  # end

  def set_food_tour
    @food_tour = FoodTour.find(params[:food_tour_id])
  end

end

