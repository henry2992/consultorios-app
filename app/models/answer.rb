class Answer < ApplicationRecord
  belongs_to :choice_question
  belongs_to :choice
  belongs_to :history

  validates :choice_id, :choice_question_id, :history_id, presence: true
end
