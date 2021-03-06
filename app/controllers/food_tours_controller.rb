class FoodToursController < ApplicationController
  before_action :set_food_tour, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    # return redirect_to roo_path if current.age < 18
    if params[:q]
      @food_tours = policy_scope(FoodTour).where("city iLIKE '%#{params[:q]}%' OR location iLIKE '%#{params[:q]}%'")
    else
      @food_tours = policy_scope(FoodTour)
    end
    @hash = Gmaps4rails.build_markers(@food_tours) do |food_tour, marker|
      marker.lat food_tour.latitude
      marker.lng food_tour.longitude
    end
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
  end

  def show
    @booking = Booking.new
    @review = Review.new
    @food_tour_coordinates = { lat: @food_tour.latitude, lng: @food_tour.longitude }
    authorize @food_tour
    @hash = Gmaps4rails.build_markers(@food_tour) do |food_tour, marker|
      marker.lat food_tour.latitude
      marker.lng food_tour.longitude
    end
  end

  def new
    @food_tour = FoodTour.new
    authorize @food_tour
  end

  def create
    dates = {}
    match_data = params[:dates].match(/([)\d\-]+) to ([\d\-]+)/)
    dates[:start_date] = match_data[1]
    dates[:end_date] = match_data[2]

    @food_tour = FoodTour.new(food_tour_params.merge(dates))
    @food_tour.user_id = current_user.id
    authorize @food_tour
    if @food_tour.save
      redirect_to food_tour_path(@food_tour)
    else
      render 'new'
    end
  end

  def update
    authorize @food_tour
    @food_tour.update(food_tour_params)
    redirect_to food_tour_path
  end

  def edit
    authorize @food_tour
  end

  def destroy
    authorize @food_tour
    @food_tour.destroy
    redirect_to dashboard_path, notice: "Done!"
    # redirect_to request.referer.include?('food_tours')
  end

  private

  def set_food_tour
    @food_tour = FoodTour.find(params[:id])
  end

  def food_tour_params
    params.require(:food_tour).permit(:title, :description, :city, :price, :cuisine, :capacity, :location, :photo, :photo_cache, :search)
  end
end

