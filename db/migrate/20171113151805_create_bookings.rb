class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :food_tour, foreign_key: true

      t.timestamps
    end
  end
end
