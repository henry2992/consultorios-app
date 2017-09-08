class Docs::AnswersController < Docs::DoctorsController

  private

    def answer_params
      params.require(:answer).permit(:choice_id, :choice_question_id, :history_id)
    end
end

