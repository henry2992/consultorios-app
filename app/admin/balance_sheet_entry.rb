ActiveAdmin.register BalanceSheetEntry do
    permit_params :title, :description, :doctor_id, :patient_id, :amount, :transaction_type_id, :transaction_date, :payment_status, :balance_sheet_id

    index do
      column :id
      column :title
      column :doctor_id
      column :patient_id
      column :amount
      column :transaction_type_id
      column :transaction_date
      column :payment_status
      actions
    end

    form do |f|
      f.inputs 'BalanceSheetEntry' do
        f.input :title
        f.input :description
        f.input :doctor_id, :label => 'Doctor', :as => :select, :collection => Doctor.all.map{|c| ["#{c.full_name}", c.id]}
        f.input :patient_id, :label => 'Patient', :as => :select, :collection => Patient.all.map{|c| ["#{c.full_name}", c.id]}
        f.input :amount
        f.input :transaction_type_id, :label => 'Transaction Type', :as => :select, :collection => TransactionType.all.map{|c| ["#{c.title} - #{c.accounting_flow}", c.id]}
        f.input :transaction_date
        f.input :payment_status
        f.input :balance_sheet_id, :label => 'Balance', :as => :select, :collection => BalanceSheet.all.map{|c| ["#{c.title} - #{c.start_at} : #{c.ends_at}", c.id]}
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
