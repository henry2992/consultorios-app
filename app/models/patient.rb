class Patient < User
  # attr_accessor :address, :phone, :doctor_id

  # Validations
  # validates :phone, presence: true, numericality: { only_integer: true }
  
  belongs_to :doctor, class_name: User, foreign_key: :doctor_id

  has_many :appointments, class_name: Appointment,
                        foreign_key: :patient_id

  has_many :balance_sheet_entries
end
