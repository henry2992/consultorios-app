class BalanceSheetEntry < ApplicationRecord
  
  belongs_to :balance_sheet

  belongs_to :doctor

  belongs_to :transaction_type

  belongs_to :patient

  validates :title, :doctor_id, :patient_id, :amount, :transaction_type_id, :transaction_date, :payment_status, :balance_sheet_id, presence: true
  
  enum payment_status: [ :no_pagado, :pagado ]
  
end
