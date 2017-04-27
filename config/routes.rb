Rails.application.routes.draw do
  
  root 'pages#home'
  # devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  ActiveAdmin.routes(self)

  namespace :docs do
  	get '/', to: 'doctors#index'
    resources :users
    resources :products
  end

  get '/no_clinic', to: 'pages#no_clinic'

end
