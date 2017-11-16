class AddCapacityToFoodTours < ActiveRecord::Migration[5.1]
  def change
    add_column :food_tours, :capacity, :integer
  end
end
