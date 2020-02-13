class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :note
      t.references :user, foreign_key: true
      t.references :work_space, foreign_key: true

      t.timestamps
    end
  end
end
