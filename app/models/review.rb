class Review < ApplicationRecord
  belongs_to :food_tour
  validates :content, length: { minimum: 20 }
end
