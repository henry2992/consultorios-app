class TransactionType < ApplicationRecord
  has_many :balance_sheet_entries

  validates :title presence: true
end
