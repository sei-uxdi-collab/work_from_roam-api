class AddAvgcleanToWorkSpaces < ActiveRecord::Migration[5.2]
  def change
    add_column :work_spaces, :avgclean, :float
  end
end
