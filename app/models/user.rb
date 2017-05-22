class User < ApplicationRecord
  belongs_to :clinic
  has_one :patient_user, foreign_key: :user_id, class_name: Patient, dependent: :destroy 
  has_many :patients, foreign_key: :doctor_id, class_name: Patient
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum role: {
    doctor: 'doctor',
    patient: 'patient',
    admin: 'admin'
  }
end
