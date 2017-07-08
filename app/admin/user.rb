ActiveAdmin.register User do
  permit_params :clinic_id, :first_name, :last_name, :email, :password, :password_confirmation, :role, :national_id, :pob, :dob, :cellphone, :office_phone, :gender

  controller do
    def update
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
      end
      super
    end
  end

  show do
    attributes_table do
      row :clinic_id
      row :first_name
      row :last_name
      row :email
      row :password
      row :password_confirmation
      row :role
      row :national_id
      row :pob, label: "Place of Birth"
      row :dob, label: "Date of Birth" 
      row :cellphone
      row :office_phone
      row :gender
    end
  end

  index do
    column :id
    column :first_name
    column :last_name
    column :email
    column :clinic
    column :role
    actions
  end

  form do |f|
    f.inputs 'User' do
      f.input :clinic_id, :label => 'Clinic', :as => :select, :collection => Clinic.all.map{|c| ["#{c.name}", c.id]}
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role
      f.input :national_id, :label => 'National ID'
      f.input :pob, :label => 'Place of Birth'
      f.input :dob, :label => 'Date of Birth', start_year: 1900
      f.input :cellphone
      f.input :office_phone
      f.input :gender
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
