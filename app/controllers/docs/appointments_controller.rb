class Docs::AppointmentsController < Docs::DoctorsController
  before_action :ensure_json_request, only: [:show]
  before_action :set_appointment_schedule, only: [:destroy]

  layout "appointments"

  def index
    @appointment = Appointment.new
  end

  def get_appointments
    @appointments = current_user.appointment_schedules
  end

  def create
    shedules = search_end(appointment_params[:timespan])
    @appointment = current_user.appointments.new(appointment_params.except(:timespan))
    respond_to do |format|
      if @appointment.save
        begin
          @appointment.appointment_schedules.create! shedules
        rescue ActiveRecord::RecordInvalid => invalid
          @appointment.destroy
          format.html { redirect_to docs_appointments_path, notice: { msg: 'Error en la fecha de programación de la cita', class: "danger"} }
          format.json { render json: @appointment.appointment_schedules.errors, status: :unprocessable_entity }
        end
        format.html { redirect_to docs_appointments_path, notice: 'La cita fue programada exitosamente.' }
      else
        format.html { render :index, notice: 'La cita no pudo ser programada.' }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @appointment_schedule.destroy
    respond_to do |format|
      format.html { redirect_to docs_appointments_path, notice: 'La cita fue eliminada exitosamente.' }
    end
  end

  private
    def appointment_params
      params.require(:appointment).permit(:patient_id, :description, :price, timespan: [])
    end

    def set_appointment_schedule
      @appointment_schedule = AppointmentSchedule.find(params[:id])
    end
    
    # This function helps to separate modules selected in calendar
    # in order to store each one into table apointment_modules as a single record
    # params:
    #   total_values type array <-- appointment_params[:timespan]
    def search_end total_values = []
      # declare return variable as an array
      data = []
      # check total_values is an array
      case total_values
        when Array then
          # with a :start = first time selected in calendar and an empty :end
          data.push({start: total_values[0].to_time, end:""})

          # iterates total_values
          total_values.each_with_index do |time, i|
            # if next value is not empty is because current item is not the last one
            if !total_values[i + 1].blank?
              # if current value + 30 minutes is not equal to next value is because 
              # the module is complete then
              if !(total_values[i].to_time + 30.minutes == total_values[i + 1].to_time)
                # store in :end current value + 30 minutes to close module
                data[data.size - 1][:end] = total_values[i].to_time + 30.minutes
                # and initialize the next one with :start next value and an empty :end
                data.push({start:total_values[i + 1], end:""})
              end
            end
          end
          # when total_value's iteration is done fill in :end with last item + 30 minutes
          data[data.size - 1][:end] = total_values[total_values.size - 1].to_time + 30.minutes
      end
      # returns the data array of modules
      return data
    end
end
