ActiveAdmin.register BalanceSheetEntry do
    permit_params :title, :description, :doctor_id, :patient_id, :transaction_date, :payment_status, :clinic_id
    
    index do
      column :id
      column :transaction_date
      column :title
      column :doctor
      column :patient
      column :payment_status
      actions
    end

    form do |f|
      f.inputs 'BalanceSheetEntry' do
        f.input :clinic_id, :label => 'Clínica', :as => :select, :collection => Clinic.all.map{|c| ["#{c.name}", c.id]}
        f.input :transaction_date
        f.input :title
        f.input :description
        f.input :doctor_id, :label => 'Doctor', :as => :select, :collection => Doctor.all.map{|c| ["#{c.full_name}", c.id]}
        f.input :patient_id, :label => 'Paciente', :as => :select, :collection => Patient.all.map{|c| ["#{c.full_name}", c.id]}
        f.input :payment_status
      end
      f.actions
    end






    
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
