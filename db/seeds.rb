c = Clinic.create!(name:'Clinica de Test', status: true)
u = Doctor.create!(email:'henry2992@hotmail.com', password:'test1234', password_confirmation:'test1234', first_name: "Henry", last_name: "Remache", clinic: c)
