class Review < ApplicationRecord
  belongs_to :food_tour
  validates :content, length: { minimum: 20 }
  validates :rating, inclusion: 0..5
end
