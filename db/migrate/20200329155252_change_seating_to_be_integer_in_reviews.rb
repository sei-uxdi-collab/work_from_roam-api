class ChangeSeatingToBeIntegerInReviews < ActiveRecord::Migration[5.2]
  def up
    change_column :reviews, :seating, :integer, using: 'seating::integer'
  end

  def down
    change_column :reviews, :seating, :string
  end
end
