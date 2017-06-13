json.extract! docs_appointment, :id, :doctor_id, :patient_id, :description, :start, :end, :price, :created_at, :updated_at
json.url docs_appointment_url(docs_appointment, format: :json)
