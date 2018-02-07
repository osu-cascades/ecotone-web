Rails.application.routes.draw do
  root    'static_pages#home'
  get     'signup'  => 'users#new'
  get     'login'   => 'sessions#new'
  post    'login'   => 'sessions#create'
  delete  'logout'  => 'sessions#destroy'

  resources :users
  resources :biodiversity_reports

  resources :plots
  get     'plots/:id/download_qr' => 'plots#download_qr'

  resources :plants
  get     'plants/:id/download_qr' => 'plants#download_qr'

  resources :password_resets, only: [:new, :create, :edit, :update]

  resources :plant_samples
  get 'export' => 'plant_samples#export'
  resources :fungi_samples
  resources :lichen_samples
  resources :macroinvertebrate_samples
  resources :mycorrhizal_fungi_samples
  resources :nonvascular_plant_samples
  resources :soil_samples
  resources :species_variation_observations
end
