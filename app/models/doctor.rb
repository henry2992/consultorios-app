class Doctor < User
  belongs_to :clinic

  has_many :patients, class_name: User,
                      foreign_key: :doctor_id

  has_many :appointments, class_name: Appointment,
                        foreign_key: :doctor_id

  has_many :appointment_schedules, through: :appointments

  has_many :balance_sheet_entries

end
