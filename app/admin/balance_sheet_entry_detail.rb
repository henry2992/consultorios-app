ActiveAdmin.register BalanceSheetEntryDetail do
    permit_params :title, :description, :amount, :transaction_type_id, :balance_sheet_entry_id
    
    index do
      column :id
      column :title
      column :amount
      column :transaction_type
      column :balance_sheet_entry
      actions
    end

    form do |f|
      f.inputs 'BalanceSheetEntry' do
        f.input :title
        f.input :description
        f.input :amount
        f.input :transaction_type_id, :label => 'Transaction Type', :as => :select, :collection => TransactionType.all.map{|c| ["#{c.title} - #{c.accounting_flow}", c.id]}
        f.input :balance_sheet_entry_id, :label => 'Balance', :as => :select, :collection => BalanceSheetEntry.all.map{|c| ["#{c.title} - #{c.transaction_date}", c.id]}
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
