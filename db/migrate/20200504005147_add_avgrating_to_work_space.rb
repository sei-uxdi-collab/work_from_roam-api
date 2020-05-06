class AddAvgratingToWorkSpace < ActiveRecord::Migration[5.2]
  def change
    add_column :work_spaces, :avgrating, :float
  end
end
