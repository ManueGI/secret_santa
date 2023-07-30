class RemoveUserToGroups < ActiveRecord::Migration[7.0]
  def change
    remove_reference(:groups, :user)
  end
end
