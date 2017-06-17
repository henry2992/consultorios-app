json.extract! appointments, :include => :appointment, :id, :appointment_id, :start, :end
json.url docs_appointment_url(appointments, format: :json)
