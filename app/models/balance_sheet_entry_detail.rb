class BalanceSheetEntryDetail < ApplicationRecord
  
  belongs_to :balance_sheet_entry, optional: true

  belongs_to :transaction_type

  validates :title, :amount, :transaction_type_id, :balance_sheet_entry_id, presence: true
  
end
