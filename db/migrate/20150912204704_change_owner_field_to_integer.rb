class ChangeOwnerFieldToInteger < ActiveRecord::Migration
  def change
    change_column :users, :owner, :integer
  end
end
