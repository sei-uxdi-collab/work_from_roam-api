class AddWifiToReview < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :wifi, :string
  end
end
