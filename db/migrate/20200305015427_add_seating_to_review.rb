class AddSeatingToReview < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :seating, :string
  end
end
