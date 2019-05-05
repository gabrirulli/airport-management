Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace 'api' do
    post 'registration', to: 'registration#create'
    post 'login', to: 'sessions#create'
    resources :flights, only: [:index, :show]
  end
end
