class Docs::AgendaController < Docs::DoctorsController
  layout "agenda"

  def index
    @patients = current_user.patients
  end

  def search_end val1, total_values, i
    if !total_values[i + 1].blank?
      i += 1
      if (val1.to_time + 30.minutes == total_values[i].to_time)
        search_end(total_values[i], total_values, i)
      else
        return_data = val1.to_time + 30.minutes
      end
      return [ return_data, i ]
    end 
  end

  def create
    data = []
    position = 0
    # puts appointment_params[:timespan]
    appointment_params[:timespan].size.times do |i|
      if position < appointment_params[:timespan].size
        # raise final.to_yaml
        puts position
        final = search_end(appointment_params[:timespan][position], appointment_params[:timespan], position)
        prepare = {
          patient_id: appointment_params[:patient_id],
          description: appointment_params[:description],
          price: appointment_params[:price],
          start:  appointment_params[:timespan][position],
          end: final[0][0].blank? ? final[0] : final[0][0]
        }
        data << prepare
      end
      break if final.blank?
      position = ( final[0][1].blank? ? final[1] : final[0][1] ) + 1
    end


    # appointment_params[:timespan].each do |r|
    #   # if !appointment_params[:timespan][i].blank?
    #     if i + 1 < appointment_params[:timespan].size
    #       final = search_end(r, appointment_params[:timespan], i)
    #       prepare = {
    #         patient_id: appointment_params[:patient_id],
    #         description: appointment_params[:description],
    #         price: appointment_params[:price],
    #         start:  appointment_params[:timespan][i],
    #         end: final[0]
    #       }
    #       data << prepare
    #       puts "\n\n"
    #       puts final[1]
    #       i = final[1] + 1
    #     end

        # puts "\n\n"
        # puts data
      # end
    # end
    raise data.to_yaml

    @appointment = current_user.appointments.new(appointment_params)
    respond_to do |format|
      if @appointment.save
        format.html { redirect_to docs_agenda_path, notice: 'La cita fue programada exitosamente.' }
      else
        format.html { render :index }
      end
    end
  end

  private
    def appointment_params
      params.require(:appointment).permit(:patient_id, :description, :price, timespan: [])
    end
end
