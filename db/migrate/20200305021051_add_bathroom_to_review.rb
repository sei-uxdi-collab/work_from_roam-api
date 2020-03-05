class AddBathroomToReview < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :bathroom, :integer
  end
end
