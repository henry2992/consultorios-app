class Patient < ApplicationRecord
  belongs_to :user, class_name: User, foreign_key: :user_id
  belongs_to :doctor, class_name: User, foreign_key: :doctor_id

  # Validations
  validates :phone, presence: true, numericality: { only_integer: true }

  scope :by, ->(search) { includes(:user).select("users.*, 1 as users").where('users.first_name LIKE ?', "%#{search}%").references(:user) }

end
