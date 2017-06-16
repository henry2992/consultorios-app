Rails.application.routes.draw do
  
  resources :create_appointment_schedules
  root 'pages#home'
  # devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  ActiveAdmin.routes(self)

  namespace :docs do
    get '/', to: 'doctors#index'
    resources :appointments, only: [:index, :create]
    resources :users
    resources :products
    resources :clinics, only: [:show]
    resources :patients
  end

  get '/no_clinic', to: 'pages#no_clinic'

end
