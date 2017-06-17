class Appointment < ApplicationRecord
  belongs_to :doctor, class_name: User,
                      foreign_key: :doctor_id
  belongs_to :patient, class_name: User,
                      foreign_key: :patient_id

  has_many :appointment_schedules, dependent: :destroy

  validates :doctor_id, :patient_id, :description, :price, presence: true
end
