class BookingsController < ApplicationController
  before_action :set_food_tour, only: [ :create ]

  def edit
   @booking = Booking.find(params[:id])
   @food_tour = @booking.food_tour
   authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.update(booking_params)
    redirect_to dashboard_path, notice: 'Successfully Updated!'
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to dashboard_path, notice: 'Done!'
  end

  def create
     @booking = Booking.new(booking_params)
     @booking.user = current_user
     @booking.food_tour = @food_tour
     if @booking.save
      authorize @booking
      # redirect_to dashboard_path
    else
      render 'new'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date)
  end

  def set_food_tour
    @food_tour = FoodTour.find(params[:food_tour_id])
  end

end

