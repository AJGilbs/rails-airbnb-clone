class FoodTour < ApplicationRecord
  belongs_to :user
  mount_uploader :photo, PhotoUploader
  geocoded_by :city
  after_validation :geocode, if: :city_changed?
end
