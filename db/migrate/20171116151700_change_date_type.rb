class ChangeDateType < ActiveRecord::Migration[5.1]
  def change
    remove_column :food_tours, :dates, :string
    add_column :food_tours, :start_date, :date
    add_column :food_tours, :end_date, :date
  end
end
