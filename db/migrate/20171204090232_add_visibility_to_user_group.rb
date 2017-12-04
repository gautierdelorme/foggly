class AddVisibilityToUserGroup < ActiveRecord::Migration[5.1]
  def change
    add_column :user_groups, :visibility, :string, null: false, default: 'public'
    add_index :user_groups, :visibility
  end
end
