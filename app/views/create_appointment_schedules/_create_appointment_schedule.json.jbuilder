json.extract! create_appointment_schedule, :id, :appointment_id, :start, :end, :created_at, :updated_at
json.url create_appointment_schedule_url(create_appointment_schedule, format: :json)
