ActiveAdmin.register BalanceSheet do
    permit_params :title, :description, :start_at, :ends_at, :clinic_id

    index do
      column :id
      column :title
      column :start_at
      column :ends_at
      actions
    end

    form do |f|
      f.inputs 'BalanceSheet' do
        f.input :clinic_id, :label => 'Clinic', :as => :select, :collection => Clinic.all.map{|c| ["#{c.name}", c.id]}
        f.input :title
        f.input :description
        f.input :start_at
        f.input :ends_at
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
