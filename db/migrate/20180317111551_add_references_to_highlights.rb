class AddReferencesToHighlights < ActiveRecord::Migration[5.0]
  def change
    add_reference :highlights, :meeting, foreign_key: true
  end
end
