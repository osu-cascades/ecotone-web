Rails.application.routes.draw do
  resources :plots
  root    'static_pages#home'
  get     'signup'  => 'users#new'
  get     'login'   => 'sessions#new'
  post    'login'   => 'sessions#create'
  delete  'logout'  => 'sessions#destroy' 
  resources :users
  resources :plants
  resources :password_resets, only: [:new, :create, :edit, :update]
end
