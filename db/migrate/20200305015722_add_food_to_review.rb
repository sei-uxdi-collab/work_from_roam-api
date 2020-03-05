class AddFoodToReview < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :food, :string
  end
end
