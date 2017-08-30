class Docs::HistoriesController < Docs::DoctorsController

  private

    def history_params
      params.require(:history).permit(:code, :patient_id, :doctor_id, :family_history, :overview)
    end
end

