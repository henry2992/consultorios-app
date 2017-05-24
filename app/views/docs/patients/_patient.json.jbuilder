json.extract! patient, :id, :address, :phone, :user_id, :doctor_id, :created_at, :updated_at
json.url patient_url(patient, format: :json)
