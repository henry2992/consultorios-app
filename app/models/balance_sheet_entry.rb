class BalanceSheetEntry < ApplicationRecord
  has_many :balance_sheet_entry_details, dependent: :destroy
  accepts_nested_attributes_for :balance_sheet_entry_details, allow_destroy: true, reject_if: :all_blank

  belongs_to :patient
  belongs_to :doctor
  belongs_to :clinic

  # validates :title, :start_at, :ends_at, :clinic_id, presence: true
  # validates_datetime :start_at, :ends_at
  # validates_datetime :ends_at, :after => :start_at, :if => :start_at

  validates :title, :doctor_id, :patient_id, :transaction_date, :payment_status, :clinic_id, presence: true
  
  scope :by_range, ->(from, to) { where("transaction_date BETWEEN ? AND ?", from, to) } 

  enum payment_status: [ :no_pagado, :pagado ]

  def details_for_form
    collection = balance_sheet_entry_details.where(balance_sheet_entry_id: id)
    collection.any? ? collection : balance_sheet_entry_details.build
  end
end
