class CreateBalanceSheetEntry < ActiveRecord::Migration[5.0]
  def change
    create_table :balance_sheet_entries do |t|
      t.string :title
      t.text :description
      t.integer :doctor_id, references: :users, foreign_key: true
      t.integer :patient_id, references: :users, foreign_key: true
      t.date :transaction_date
      t.integer :payment_status, default: 0
      t.belongs_to :clinic, foreign_key: true
      t.timestamps
    end
  end
end
