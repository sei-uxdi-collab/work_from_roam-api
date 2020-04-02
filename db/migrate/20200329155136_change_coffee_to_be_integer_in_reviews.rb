class ChangeCoffeeToBeIntegerInReviews < ActiveRecord::Migration[5.2]
  def up
    change_column :reviews, :coffee, :integer, using: 'coffee::integer'
  end

  def down
    change_column :reviews, :coffee, :string
  end
end
