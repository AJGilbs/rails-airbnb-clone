class FoodTour < ApplicationRecord
  include PgSearch
  pg_search_scope :tour_search, against: [ :city, :country]

  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  belongs_to :user

  mount_uploader :photo, PhotoUploader
  geocoded_by :city
  after_validation :geocode, if: :city_changed?

  def average_rating
    if self.reviews.count > 0
      total = 0
      self.reviews.each do |review|
        total += review.rating
      end
      return total / self.reviews.count
    end
  end

end
