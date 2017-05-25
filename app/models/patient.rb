class Patient < User
  # attr_accessor :address, :phone, :doctor_id

  # Validations
  # validates :phone, presence: true, numericality: { only_integer: true }
  
  belongs_to :doctor, class_name: User, foreign_key: :doctor_id

  # scope :by, ->(search) { where('first_name LIKE ?', "%#{search}%") }

end
