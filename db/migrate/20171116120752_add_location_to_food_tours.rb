class AddLocationToFoodTours < ActiveRecord::Migration[5.1]
  def change
    add_column :food_tours, :location, :string
  end
end
