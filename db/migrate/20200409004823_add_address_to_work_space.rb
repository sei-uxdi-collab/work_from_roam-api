class AddAddressToWorkSpace < ActiveRecord::Migration[5.2]
  def change
    add_column :work_spaces, :address, :string
  end
end
