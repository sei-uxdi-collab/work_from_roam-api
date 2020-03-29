class ChangeOutletToBeIntegerInReviews < ActiveRecord::Migration[5.2]
  def up
    change_column :reviews, :outlet, :integer, using: 'outlet::integer'
  end

  def down
    change_column :reviews, :outlet, :string
  end
end
