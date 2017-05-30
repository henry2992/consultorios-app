class Docs::PatientsController < Docs::DoctorsController
  helper_method :sort_column, :sort_direction
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  
  def index
    @patients = current_user.patients.order("#{sort_column} #{sort_direction}").paginate(:page => params[:page], :per_page => 25)
    @patients = @patients.by(params[:search]) unless params[:search].blank?
  end

  def show
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

  private

    def set_patient
      @patient = current_user.patients.find(params[:id])
    end

    def patient_params
      params.require(:patient).permit(:first_name, :last_name, :email, :address, :phone)
    end

    def sort_column
      ["users.first_name", "phone"].include?(params[:sort]) ? params[:sort] : "id"
    end

    def sort_direction
      ["asc", "desc"].include?(params[:direction]) ? params[:direction] : "asc"
    end
end

