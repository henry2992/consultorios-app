ActiveAdmin.register User do
  # permit_params :clinic, :email, :first_name, :last_name, :password, :password_confirmation

  index do
    column :id
    column :first_name
    column :last_name
    column :email
    column :clinic
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
