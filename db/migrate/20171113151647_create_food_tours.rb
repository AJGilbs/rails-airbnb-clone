class CreateFoodTours < ActiveRecord::Migration[5.1]
  def change
    create_table :food_tours do |t|
      t.string :title
      t.text :description
      t.string :city
      t.integer :price
      t.string :dates
      t.string :cuisine
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
