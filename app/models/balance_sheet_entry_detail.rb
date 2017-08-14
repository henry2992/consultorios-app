class BalanceSheetEntryDetail < ApplicationRecord
  
  belongs_to :balance_sheet_entry, optional: true, :inverse_of => :balance_sheet_entry_details

  belongs_to :transaction_type

  validates :title, :amount, :transaction_type_id, presence: true
  
end
