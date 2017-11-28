class CreateDataEndpoints < ActiveRecord::Migration[5.1]
  def change
    create_table :data_endpoints do |t|
      t.string :name, null: false, index: true
      t.text :description, null: false, index: true
      t.string :method, null: false
      t.string :path, null: false
      t.references :data_source, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
