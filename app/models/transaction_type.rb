class TransactionType < ApplicationRecord
  has_many :balance_sheet_entry_details

  validates :title, presence: true

  enum accounting_flow: [ :incoming, :outgoing ]
  
  enum deferred: [ :no, :yes ]

end
