class ChangeFoodToBeIntegerInReviews < ActiveRecord::Migration[5.2]
  def up
    change_column :reviews, :food, :integer, using: 'food::integer'
  end

  def down
    change_column :reviews, :food, :string
  end
end
