class Docs::PatientsController < Docs::DoctorsController
  helper_method :sort_column, :sort_direction
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  
  def index
    @patients = current_user.patients.order("#{sort_column} #{sort_direction}").paginate(:page => params[:page], :per_page => 25)
    @patients = @patients.by(params[:search]) unless params[:search].blank?
  end

  def show
    @history = @patient.history
    @attachment = @history.attachments.new
  end

  def new
    @patient = Patient.new
  end

  def edit
  end

  def create
    @patient = current_user.patients.invite!(patient_params)
    respond_to do |format|
      if @patient
        @patient.create_history! doctor: @patient.doctor, code: OpenSSL::Random.random_bytes(3).unpack('H*').join.upcase
        format.html { redirect_to docs_patients_path, notice: 'El paciente fue creado exitosamente.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to docs_patients_url, notice: 'El paciente fue actualizado exitosamente.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to docs_patients_url, notice: 'El paciente fue eliminado exitosamente' }
    end
  end

  def upload_image
    @attachment = Attachment.create( attachment_params )
    respond_to do |format|
      if @attachment
        h = History.find(attachment_params[:imageable_id])
        format.html { redirect_to docs_patient_path(h.patient), notice: 'La imagen fue creada exitosamente.' }
      else
        format.html { redirect_to docs_patient_path(h.patient), notice: { msg: 'Error al guardar la imagen', class: "danger"} }
      end
    end
  end

  def show_image
    @attachment = Attachment.find(params['id'])

    if @attachment
      render json: {url_image: @attachment.image.url(:mini), description: @attachment.description}
    else
      render json: "Imagen no encontrada".to_json
    end
  end

  def update_image
    @patient = Patient.find(params['id_patient'])

    if Attachment.find(params['id']).update(attachment_params)
      redirect_to docs_patient_path(@patient), notice: 'La imagen fue actualizada exitosamente.'
    else
      redirect_to docs_patient_path(@patient), notice: { msg: 'Error al actualizar la imagen la historia', class: "danger" }
    end
  end

  def delete_image
    render json: Attachment.find(params['id']).destroy
  end

  private

    def set_patient
      @patient = current_user.patients.find(params[:id])
    end

    def patient_params
      params.require(:patient).permit(:first_name, :last_name, :email, :address, :phone, :national_id, :pob, :dob, :cellphone, :office_phone, :gender )
    end

    def attachment_params
      params.require(:attachment).permit(:imageable_id, :imageable_type, :description, :image )
    end

    def sort_column
      ["users.first_name", "phone"].include?(params[:sort]) ? params[:sort] : "id"
    end

    def sort_direction
      ["asc", "desc"].include?(params[:direction]) ? params[:direction] : "asc"
    end
end

