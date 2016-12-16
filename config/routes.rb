Rails.application.routes.draw do
  root 'users#index'
  resources :users

  match 'login'  =>  'sessions#new',  via: [:get],  :as => "login_path"
  match 'login'  =>  'sessions#create',  via: [:post]

end
