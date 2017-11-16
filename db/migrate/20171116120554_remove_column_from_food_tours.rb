class RemoveColumnFromFoodTours < ActiveRecord::Migration[5.1]
  def change
    remove_column :food_tours, :country
  end
end
