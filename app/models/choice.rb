class Choice < ApplicationRecord
  has_many :choice_questions, dependent: :destroy
  has_many :questions, through: :choice_questions

  validates :choice_text, presence: true
end
