class History < ApplicationRecord

  belongs_to :doctor, class_name: User,
                      foreign_key: :doctor_id
  belongs_to :patient, class_name: User,
                      foreign_key: :patient_id

  has_many :answers

  has_many :attachments, as: :imageable

  validates :doctor_id, :patient_id, :code, presence: true
end
