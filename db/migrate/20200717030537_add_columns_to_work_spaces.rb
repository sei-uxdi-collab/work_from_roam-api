class AddColumnsToWorkSpaces < ActiveRecord::Migration[5.2]
  def change
    add_column :work_spaces, :bool_cafe, :boolean
    add_column :work_spaces, :bool_restaurant, :boolean
    add_column :work_spaces, :bool_library, :boolean
  end
end
