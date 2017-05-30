class Doctor < User
  belongs_to :clinic

  has_many :patients, class_name: User,
                      foreign_key: :doctor_id
end
