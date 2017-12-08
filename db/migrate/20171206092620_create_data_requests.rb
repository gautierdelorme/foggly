class CreateDataRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :data_requests do |t|
      t.references :data_endpoint, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.string :url, null: false
      t.json :params, null: false, default: {}
      t.json :response, null: false, default: {}

      t.timestamps
    end
  end
end
