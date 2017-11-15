class AddCoordinatesToFoodTours < ActiveRecord::Migration[5.1]
  def change
    add_column :food_tours, :latitude, :float
    add_column :food_tours, :longitude, :float
  end
end
