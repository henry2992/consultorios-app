class Docs::QuestionsController < Docs::DoctorsController
  private

    def question_params
      params.require(:question).permit(:question_text)
    end
end

