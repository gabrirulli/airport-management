Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace 'api' do
    post 'registration', to: 'registration#create'
    post 'login', to: 'sessions#create'
    resources :flights, only: [:index, :show]
    resources :bookings, controller: 'flight_bookings', except: [:update, :edit, :new]
  end
end
