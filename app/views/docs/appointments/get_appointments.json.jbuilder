json.appointments(@appointments) do |a|
  json.id a.id
  json.start a.start
  json.end a.end
  json.title "#{a.appointment.patient.first_name} #{a.appointment.patient.first_name} - #{a.appointment.description.truncate(100)} "
  json.url docs_appointment_path(a)
end
