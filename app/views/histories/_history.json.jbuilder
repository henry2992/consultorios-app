json.extract! history, :id, :code, :patient_id, :doctor_id, :family_history, :overview, :created_at, :updated_at
json.url history_url(history, format: :json)
