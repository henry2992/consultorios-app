class Clinic < ApplicationRecord
  has_many :users

  has_many :balance_sheet_entries
end
