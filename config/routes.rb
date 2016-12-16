Rails.application.routes.draw do
  root 'users#index'
  resources :users

  match 'login'  =>  'sessions#new',  via: [:get],  :as => "login"
  match 'login'  =>  'sessions#create',  via: [:post]
  match 'logout'  =>  'sessions#destroy',  via: [:delete], :as => "logout"

end
