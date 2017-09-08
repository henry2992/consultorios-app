class Patient < User
  # attr_accessor :address, :phone, :doctor_id

  # Validations
  # validates :phone, presence: true, numericality: { only_integer: true }
  
  belongs_to :doctor, class_name: User, foreign_key: :doctor_id

  has_many :appointments, class_name: Appointment,
                        foreign_key: :patient_id

  has_many :balance_sheet_entries
  has_many :balance_sheet_entry_details, through: :balance_sheet_entries

  has_one :history, dependent: :destroy

  def age
    self.dob.blank? ? Date.today : (Time.now.to_s(:number).to_i - self.dob.to_time.to_s(:number).to_i)/10e9.to_i
  end

end
