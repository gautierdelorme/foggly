class CreateConversations < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations do |t|
      t.references :user, index: true
      t.references :participant, index: true
      t.timestamps
    end

    add_index :conversations, %i[user_id participant_id], unique: true
  end
end
