class AddNoiseToReview < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :noise, :integer
  end
end
