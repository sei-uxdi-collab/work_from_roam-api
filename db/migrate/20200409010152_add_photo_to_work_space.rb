class AddPhotoToWorkSpace < ActiveRecord::Migration[5.2]
  def change
    add_column :work_spaces, :photo, :string
  end
end
