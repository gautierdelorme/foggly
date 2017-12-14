class CreateDataReports < ActiveRecord::Migration[5.1]
  def change
    create_table :data_reports do |t|
      t.string :name, null: false, index: true
      t.text :body
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
