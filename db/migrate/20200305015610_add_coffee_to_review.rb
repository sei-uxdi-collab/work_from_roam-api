class AddCoffeeToReview < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :coffee, :string
  end
end
