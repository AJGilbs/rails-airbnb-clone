class FoodTour < ApplicationRecord
  include PgSearch
  pg_search_scope :tour_search, against: [ :city, :country]

  has_many :bookings, dependent: :destroy
  belongs_to :user

  mount_uploader :photo, PhotoUploader
  geocoded_by :city
  after_validation :geocode, if: :city_changed?
end
