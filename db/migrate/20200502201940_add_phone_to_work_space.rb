class AddPhoneToWorkSpace < ActiveRecord::Migration[5.2]
  def change
    add_column :work_spaces, :phone, :string
  end
end
