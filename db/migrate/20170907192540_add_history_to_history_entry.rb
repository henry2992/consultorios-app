class AddHistoryToHistoryEntry < ActiveRecord::Migration[5.0]
  def change
    add_reference :history_entries, :history, foreign_key: true
  end
end
