class BalanceSheetEntry < ApplicationRecord
  include PgSearch
  
  has_many :balance_sheet_entry_details
  belongs_to :patient
  belongs_to :doctor
  belongs_to :clinic

  # validates :title, :start_at, :ends_at, :clinic_id, presence: true
  # validates_datetime :start_at, :ends_at
  # validates_datetime :ends_at, :after => :start_at, :if => :start_at

  validates :title, :doctor_id, :patient_id, :transaction_date, :payment_status, :clinic_id, presence: true
  
  pg_search_scope :by,
    :against => [:title, :description, :doctor_id, :patient_id, :transaction_date, :payment_status],
    :using => {
      :tsearch => {:prefix => true, :any_word => true}
    }

  enum payment_status: [ :no_pagado, :pagado ]

end
