class CreateUserGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :user_groups do |t|
      t.string :name, index: true, null: false, default: ''
      t.text :description, null: false, default: ''

      t.timestamps
    end
  end
end
