class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
     @food_tours = FoodTour.where.not(latitude: nil, longitude: nil)

      @hash = Gmaps4rails.build_markers(@food_tours) do |food_tour, marker|
      marker.lat food_tour.latitude
      marker.lng food_tour.longitude
    end
  end

  def dashboard
    @user = current_user
  end
end
