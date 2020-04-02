class ChangeWifiToBeIntegerInReviews < ActiveRecord::Migration[5.2]
  def up
    change_column :reviews, :wifi, :integer, using: 'wifi::integer'
  end

  def down
    change_column :reviews, :wifi, :string
  end
end
