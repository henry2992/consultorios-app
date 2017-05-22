class Patient < ApplicationRecord
  belongs_to :user, class_name: User, foreign_key: :user_id
  belongs_to :doctor, class_name: User, foreign_key: :doctor_id

  # Validations
  validates :phone, presence: true, numericality: { only_integer: true }
end
