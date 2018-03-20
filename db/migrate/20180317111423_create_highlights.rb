class CreateHighlights < ActiveRecord::Migration[5.0]
  def change
    create_table :highlights do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.text :highlight_text

      t.timestamps
    end
  end
end
