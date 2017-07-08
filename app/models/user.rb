class User < ApplicationRecord
  include PgSearch
  
  pg_search_scope :by,
    :against => [:email, :first_name, :last_name, :address, :phone],
    :using => {
      :tsearch => {:prefix => true, :any_word => true}
    }
    
  self.inheritance_column = :role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  enum role: {
    Doctor: 'Doctor',
    Patient: 'Patient',
    Administrator: 'Administrator'
  }
  
  enum gender: [ :masculino, :femenino ]

  def full_name
    "#{first_name} #{last_name}"
  end

end
