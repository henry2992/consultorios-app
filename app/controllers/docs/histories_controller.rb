class Docs::HistoriesController < Docs::DoctorsController
  before_action :set_history, only: [:update]
  before_action :set_patient, only: [:update]

  def update
    respond_to do |format|
      if @patient.history.update(history_params)
        Answer.where(history: @patient.history).destroy_all.to_json
        params[:history][:questions].each do |a,i|
          Answer.create! choice_question: ChoiceQuestion.where(choice: i.to_i, question_id: a.to_i).take, history: @patient.history, choice: Choice.find(i.to_i)
        end
        format.html { redirect_to docs_patient_path(@patient), notice: 'La historia fue actualizada exitosamente.' }
      else
        format.html { redirect_to docs_patient_path(@patient), notice: { msg: 'Error al actualizar la historia', class: "danger"} }
      end
    end
  end

  private

    def set_history
      @history = History.find(params[:id])
    end

    def set_patient
      set_history
      @patient = @history.patient
    end

    def history_params
      params.require(:history).permit(:code, :patient_id, :doctor_id, :family_history, :overview, :questions => [] )
    end
end

