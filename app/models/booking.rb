class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :food_tour
end
