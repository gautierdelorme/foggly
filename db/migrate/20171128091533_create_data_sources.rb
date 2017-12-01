class CreateDataSources < ActiveRecord::Migration[5.1]
  def change
    create_table :data_sources do |t|
      t.string :name, null: false, index: true
      t.text :description, null: false, index: true
      t.string :base_url, index: true, default: ''
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
