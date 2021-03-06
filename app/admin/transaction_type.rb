ActiveAdmin.register TransactionType do
    permit_params :title, :description, :accounting_flow

    index do
      column :id
      column :title
      column :accounting_flow
      actions
    end

    form do |f|
      f.inputs 'TransactionType' do
        f.input :title
        f.input :description
        f.input :accounting_flow
        f.input :deferred
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
