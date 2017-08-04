class CreateBalanceSheetEntryDetail < ActiveRecord::Migration[5.0]
  def change
    create_table :balance_sheet_entry_details do |t|
      t.string :title
      t.text :description
      t.decimal :amount, precision: 10, scale: 2
      t.belongs_to :transaction_type, foreign_key: true
      t.belongs_to :balance_sheet_entry, foreign_key: true
      t.timestamps
    end
  end
end
