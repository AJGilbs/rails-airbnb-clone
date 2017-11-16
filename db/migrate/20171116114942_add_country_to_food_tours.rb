class AddCountryToFoodTours < ActiveRecord::Migration[5.1]
  def change
    add_column :food_tours, :country, :string
  end
end
