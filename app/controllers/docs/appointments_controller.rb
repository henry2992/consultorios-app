class Docs::AppointmentsController < Docs::DoctorsController

  private

    def appointment_params
      params.require(:appointment).permit(:doctor_id, :patient_id, :description, :start, :end, :price)
    end
end

