class ChoiceQuestion < ApplicationRecord
  belongs_to :choice
  belongs_to :question

  has_many :answers, dependent: :destroy
  
  validates :choice_id, :question_id, presence: true
end
