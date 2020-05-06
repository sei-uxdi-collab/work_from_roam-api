class AddDetailsToWorkSpace < ActiveRecord::Migration[5.2]
  def change
    add_column :work_spaces, :avgnoise, :float
    add_column :work_spaces, :avgwifi, :float
    add_column :work_spaces, :avgbathroom, :float
    add_column :work_spaces, :avgseating, :float
  end
end
