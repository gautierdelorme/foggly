class AddRoleToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :role, :string, null: false, default: 'member'
    add_index :users, :role
  end
end
