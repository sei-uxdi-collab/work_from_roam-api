class CreateWorkSpaces < ActiveRecord::Migration[5.2]
  def change
    create_table :work_spaces do |t|
      t.string :place_id
      t.float :lat
      t.float :lng
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
