c = Clinic.create!(name:'Clinica de Test', status: true)
u = Doctor.create!(email:'henry2992@hotmail.com', password:'test1234', password_confirmation:'test1234', first_name: "Henry", last_name: "Remache", clinic: c)

# Pacientes
(0..50).each_with_index do |number, index|
	p = Patient.create(email: 'paciente' + index.to_s + '@email.com' , password:'test1234', password_confirmation:'test1234', first_name: "Paciente", last_name: "Numero " + index.to_s)
	p.doctor = u
	p.save!
  p.create_history! doctor: p.doctor, code: OpenSSL::Random.random_bytes(3).unpack('H*').join.upcase
end

TransactionType.create!(title:'Ingreso', description:'Activos', accounting_flow: 0, deferred: 0)
TransactionType.create!(title:'Gasto', description:'Pasivos', accounting_flow: 1, deferred: 0)
TransactionType.create!(title:'Cuentas por Cobrar', description:'Activos Diferidos', accounting_flow: 0, deferred: 1)
TransactionType.create!(title:'Cuentas por Pagar', description:'Pasivos Diferidos', accounting_flow: 1, deferred: 1)


q = Question.create! question_text: "¿Está usted bajo tratamiento médico?"
q = Question.create! question_text: "¿Toma actualmente algún medicamento?"
q = Question.create! question_text: "¿Le han practicado alguna invervención quirúrgica?"
q = Question.create! question_text: "¿Ha recibido alguna transfusión sanguinea?"
q = Question.create! question_text: "¿Ha consumido o consume drogas?"
q = Question.create! question_text: "Ha presentado reacción alérgica a:", show_options: false
  q_child = q.questions.create! question_text: "Penicilina"
  q_child = q.questions.create! question_text: "Anestesia"
  q_child = q.questions.create! question_text: "Aspirina, Yodo"
  q_child = q.questions.create! question_text: "Merthiolate, otros"
q = Question.create! question_text: "¿Sufre de tensión arterial?"
  q_child = q.questions.create! question_text: "Alta"
  q_child = q.questions.create! question_text: "Baja"
q = Question.create! question_text: "¿Sangra excesivamente al cortarse?"
  q_child = q.questions.create! question_text: "Anemia, leucemia, hemofilia, déficit Vit. K"
q = Question.create! question_text: "¿Es usted V.I.H.+?"
q = Question.create! question_text: "¿Toma usted algún medicamento retroviral?"
q = Question.create! question_text: "¿Está usted embarazada?"
q = Question.create! question_text: "¿Está tomando actualmente pastillas anticonceptivas?"
q = Question.create! question_text: "Sufre de:", show_options: false
  q_child = q.questions.create! question_text: "Enfermedades venéreas"
  q_child = q.questions.create! question_text: "Problemas del corazon"
  q_child = q.questions.create! question_text: "Hepatitis "
  q_child = q.questions.create! question_text: "Fiebre Reumatica"
  q_child = q.questions.create! question_text: "Asma"
  q_child = q.questions.create! question_text: "Diabetes"
  q_child = q.questions.create! question_text: "Úlcera gástrica"
  q_child = q.questions.create! question_text: "Tiroides"
q = Question.create! question_text: "¿Ha tenido limitación al abrir o cerrar la boca?"
q = Question.create! question_text: "¿Siente ruidos en la mandíbula al abrir o cerrar la boca?"
q = Question.create! question_text: "¿Sufre de herpes o aftas recurrentes?"
q = Question.create! question_text: "¿Presenta alguno de los siguientes hábitos?", show_options: false
  q_child = q.questions.create! question_text: "¿Fuma?"
  q_child = q.questions.create! question_text: "Consume alimentos cítricos?"
q = Question.create! question_text: "¿Muerde objetos con los dientes?"
  q_child = q.questions.create! question_text: "Apretamiento Dentario"
  q_child = q.questions.create! question_text: "Respiracion bucal"

c1 = Choice.create! choice_text: "Sí"
c2 = Choice.create! choice_text: "No"

Question.all.each do |q|
  q.choice_questions.create! choice: c1
  q.choice_questions.create! choice: c2
end