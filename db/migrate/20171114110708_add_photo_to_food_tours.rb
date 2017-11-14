class AddPhotoToFoodTours < ActiveRecord::Migration[5.1]
  def change
    add_column :food_tours, :photo, :string
  end
end
