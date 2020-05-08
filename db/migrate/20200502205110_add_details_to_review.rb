class AddDetailsToReview < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :petfriendly, :integer
    add_column :reviews, :wifipass, :integer
    add_column :reviews, :goodforgroup, :integer
    add_column :reviews, :alcohol, :integer
    add_column :reviews, :parking, :integer
    add_column :reviews, :meetingspace, :integer
    add_column :reviews, :outdoorspace, :integer
  end
end
