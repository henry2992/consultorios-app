class Docs::PatientsController < Docs::DoctorsController
  private

    def patient_params
      params.require(:patient).permit(:address, :phone, :user_id, :doctor_id)
    end
end

