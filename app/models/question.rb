class Question < ApplicationRecord
  has_many :questions, class_name: "Question", foreign_key: "question_id"
  belongs_to :question, class_name: "Question", optional: true

  has_many :choice_questions, dependent: :destroy
  has_many :choices, through: :choice_questions

  validates :question_text, presence: true
end
