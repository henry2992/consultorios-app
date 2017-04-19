Rails.application.routes.draw do
  # devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  ActiveAdmin.routes(self)

end
