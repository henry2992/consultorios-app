c = Clinic.create!(name:'Clinica de Test', status: true)
u = Doctor.create!(email:'henry2992@hotmail.com', password:'test1234', password_confirmation:'test1234', first_name: "Henry", last_name: "Remache", clinic: c)

# Pacientes
(0..50).each_with_index do |number, index|
	p = Patient.create!(email: 'paciente' + index.to_s + '@email.com' , password:'test1234', password_confirmation:'test1234', first_name: "Paciente", last_name: "Numero " + index.to_s)
	p.doctor = u
	p.save!
end


TransactionType.create!(title:'Ingreso', descrption:'Activos', accounting_flow: 0, deferred: 0)
TransactionType.create!(title:'Gasto', descrption:'Pasivos', accounting_flow: 1, deferred: 0)
TransactionType.create!(title:'Cuentas por Cobrar', descrption:'Activos Diferidos', accounting_flow: 0, deferred: 1)
TransactionType.create!(title:'Cuentas por Pagar', descrption:'Pasivos Diferidos', accounting_flow: 0, deferred: 1)