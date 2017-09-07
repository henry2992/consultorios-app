class AddColumnToHistoryEntry < ActiveRecord::Migration[5.0]
  def change
    add_reference :history_entries, :history, index: true
  end
end
