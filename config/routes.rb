Rails.application.routes.draw do
  
  root 'pages#home'
  # devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  ActiveAdmin.routes(self)

  namespace :docs do
    get '/', to: 'doctors#index'
    get '/myclinic', to: 'doctors#my_clinic', as: "myclinic"
    resources :appointments, only: [:index, :create, :edit, :destroy]
    get '/dates', to: 'appointments#get_appointments'
    resources :users
    resources :products
    resources :balance_sheet_entries, :path => "cuentas" do
      resources :balance_sheet_entry_details, :path => "detalles"
    end
    # resources :balance_sheet_entries, :path => "cuentas", :as => :cuentas
    
    post '/image', to: 'patients#upload_image'
    post '/image/:id', to: 'patients#show_image'
    delete '/image/:id', to: 'patients#delete_image'
    post '/update_image/:id', to: 'patients#update_image'
    resources :patients
    
    resources :answers
    resources :choice_questions
    resources :choices
    resources :questions
    
    resources :histories

    post 'new_history_entry/', to: 'histories#create_entry'
    post 'update_history_entry/:id', to: 'histories#update_entry'
    post 'show_history_entry/:id', to: 'histories#show_entry'
    delete 'history_entry/:id', to: 'histories#delete_entry'
  end


  get '/no_clinic', to: 'pages#no_clinic'

end
