class Docs::ChoiceQuestionsController < Docs::DoctorsController

  private

    def choice_question_params
      params.require(:choice_question).permit(:choice_id, :question_id)
    end
end

