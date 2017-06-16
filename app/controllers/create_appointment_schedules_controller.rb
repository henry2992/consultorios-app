class CreateAppointmentSchedulesController < InheritedResources::Base

  private

    def create_appointment_schedule_params
      params.require(:create_appointment_schedule).permit(:appointment_id, :start, :end)
    end
end

