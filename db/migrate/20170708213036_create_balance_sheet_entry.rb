class CreateBalanceSheetEntry < ActiveRecord::Migration[5.0]
  def change
    create_table :balance_sheet_entries do |t|
      t.string :title
      t.text :description
      t.belongs_to :doctor, foreign_key: true
      t.belongs_to :patient, foreign_key: true
      t.decimal :amount, precision: 10, scale: 2
      t.belongs_to :transaction_type, foreign_key: true
      t.date :transaction_date
      t.integer :payment_status, default: 0
      t.belongs_to :balance_sheet, foreign_key: true
      t.timestamps
    end
  end
end
