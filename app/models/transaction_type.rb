class TransactionType < ApplicationRecord
  has_many :balance_sheet_entries

  validates :title presence: true

  enum accounting_flow: [ :incoming, :outgoing ]

end
