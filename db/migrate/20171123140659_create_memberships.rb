class CreateMemberships < ActiveRecord::Migration[5.1]
  def change
    create_table :memberships do |t|
      t.references :user, foreign_key: true, index: true
      t.references :user_group, foreign_key: true, index: true

      t.timestamps
    end
  end
end
