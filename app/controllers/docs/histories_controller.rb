class Docs::HistoriesController < Docs::DoctorsController
  before_action :set_history, except: [:delete_entry]
  before_action :set_patient, except: [:delete_entry]

  def create_entry
    @history_entry = @history.history_entries.new(history_entry_params)
    if @history_entry.save
      if params['history_entry']['attachment']
        Attachment.create(image: params['history_entry']['attachment'], imageable: @history_entry)
      end
      redirect_to docs_patient_path(@patient), notice: 'La entrada fue creada exitosamente.'
    else
      redirect_to docs_patient_path(@patient), notice: { msg: 'Error al crear la entrada la historia', class: "danger"}
    end
  end

  def show_entry
      @history_entry = HistoryEntry.find(params['id'])
      if @history_entry.attachments.count > 0
        @attachment = @history_entry.attachments.last.image.url(:mini)
      else
        @attachment = ''
      end
      
      render json: {history_entry: @history_entry, attachment: @attachment}
  end

  def update_entry
    @history_entry = HistoryEntry.find(params['id_history_entry'])
    if @history_entry.update(history_entry_params)
      if params['history_entry']['attachment']
        if @history_entry.attachments.count > 0
          @history_entry.attachments.last.destroy
        end
        Attachment.create(image: params['history_entry']['attachment'], imageable: @history_entry)
      end
      redirect_to docs_patient_path(@patient), notice: 'La entrada fue actualizada exitosamente.'
    else
      redirect_to docs_patient_path(@patient), notice: { msg: 'Error al actualizar la entrada la historia', class: "danger"}
    end
  end

  def delete_entry
    render json: HistoryEntry.find(params['id']).destroy
  end

  def update
    respond_to do |format|
      if @patient.history.update(history_params)
        Answer.where(history: @patient.history).destroy_all.to_json
        params[:history][:questions].each do |a,i|
          # ChoiceQuestion.where(choice: Choice.find(i.to_i), question: Question.find(a.to_i)).destroy_all
          # cq = ChoiceQuestion.create! choice: Choice.find(i.to_i), question: Question.find(a.to_i)
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

    def history_entry_params
      params.require(:history_entry).permit(:reason_for_the_visit, :pain, :gingivitis, :control, :prosthetic_restoration, :other, :current_disease, :appearance, :face, :lips_and_commissure, :nodes, :cheeks, :mucosa, :gum, :tongue, :palate, :rx_panoramic, :rx_coronal, :rx_periapical, :observations )
    end
end

