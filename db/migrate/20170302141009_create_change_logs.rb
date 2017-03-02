class CreateChangeLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :change_logs do |t|
      t.integer :object_id
      t.string :object_type
      t.datetime :timestamp
      t.jsonb :object_changes
    end
  end
end
