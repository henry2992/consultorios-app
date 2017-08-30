class Docs::ChoicesController < Docs::DoctorsController

  private

    def choice_params
      params.require(:choice).permit(:choice_text)
    end
end

