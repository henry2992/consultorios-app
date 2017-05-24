class Docs::PatientsController < Docs::DoctorsController
  helper_method :sort_column, :sort_direction

  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  
  def index
    @patients = Patient.by(params[:search]).order("#{sort_column} #{sort_direction}").paginate(:page => params[:page], :per_page => 1)
  end

  def show
  end

  def new
    @patient = Patient.new
    @user = nil
  end

  def edit
    @user = nil
    @user ||= @patient.user
  end

  def create
    user = User.create! user_params(patient_params)
    @patient = current_user.patients.create! ptnt_params(patient_params, user[0])
    respond_to do |format|
      if @patient
        format.html { redirect_to docs_patient_path(@patient), notice: 'El paciente fue creado exitosamente.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    user = @patient.user.update(user_params(patient_params)[0].except(:password, :password_confirmation, :clinic))
    patient = @patient.update(ptnt_params(patient_params, @patient.user)[0].except(:user_id))
    respond_to do |format|
      if user && patient
        format.html { redirect_to edit_docs_patient_path(@patient), notice: 'El paciente fue actualizado exitosamente.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
    def ptnt_params params, user
      [
        address: params[:address],
        phone: params[:phone],
        user_id: user.id
      ]
    end
    def user_params params
      [ 
        first_name: params[:first_name], 
        last_name: params[:last_name], 
        email: params[:email],
        password: "12345678",
        password_confirmation: "12345678",
        clinic: current_user.clinic
      ]
    end

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

