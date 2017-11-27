class AddUserToUserGroups < ActiveRecord::Migration[5.1]
  def change
    add_reference :user_groups, :user, foreign_key: true, null: false, default: 1
  end
end
