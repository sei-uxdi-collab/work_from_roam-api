class AddNameToWorkSpace < ActiveRecord::Migration[5.2]
  def change
    add_column :work_spaces, :name, :string
  end
end
