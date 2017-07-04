class AppointmentSchedule < ApplicationRecord
  belongs_to :appointment, optional: :true

  validates :appointment_id, :start, :end, presence: true
  validates_datetime :start, :after => :now
  validates_datetime :end, :after => :start, :if => :start
end
