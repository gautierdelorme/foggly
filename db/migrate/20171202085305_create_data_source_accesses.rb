class CreateDataSourceAccesses < ActiveRecord::Migration[5.1]
  def change
    create_table :data_source_accesses do |t|
      t.references :data_source, foreign_key: true, null: false
      t.references :user_group, foreign_key: true, null: false

      t.timestamps
    end
  end
end
