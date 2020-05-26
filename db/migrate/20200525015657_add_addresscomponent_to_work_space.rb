class AddAddresscomponentToWorkSpace < ActiveRecord::Migration[5.2]
  def change
    add_column :work_spaces, :addresscomponent, :text, array: true, default: []
  end
end
