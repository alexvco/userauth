Rails.application.routes.draw do

  root 'users#index'
  resources :users

  match 'password_reset'  =>  'password_resets#new',  via: [:get],  :as => "new_password_reset"
  match 'password_reset'  =>  'password_resets#create',  via: [:post]
  match 'password_reset/:reset/edit'  =>  'password_resets#edit',  via: [:get], as: "edit_password_reset"
  match 'password_reset/:reset/edit'  =>  'password_resets#update',  via: [:patch]

  match 'login'  =>  'sessions#new',  via: [:get],  :as => "login"
  match 'login'  =>  'sessions#create',  via: [:post]
  match 'logout'  =>  'sessions#destroy',  via: [:delete], :as => "logout"

  match '/account_activations/:activation_token/edit'  =>  'account_activations#edit',  via: [:get],  :as => "edit_account_activation"

end
