class AddOutletToReview < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :outlet, :string
  end
end
