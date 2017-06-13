class Docs::AgendaController < Docs::DoctorsController
  layout "agenda"

  def index
    @patients = current_user.patients
  end

  def create
    
  end
  private
    def appointment_params
      params.require(:appointment).permit(:patient_id, :description, :price, , time_span: [[:start, :end]])
    end
end
