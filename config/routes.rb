Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root    'static_pages#home'

  resources :users
  resources :biodiversity_reports

  get     'map' , to: 'static_pages#map'

  resources :plots
  get     'plots/:id/download_qr' => 'plots#download_qr'

  resources :plants
  get     'plants/:id/download_qr' => 'plants#download_qr'

  resources :plant_samples
  get 'export' => 'plant_samples#export'
  resources :fungi_samples
  resources :lichen_samples
  resources :macroinvertebrate_samples
  resources :mycorrhizal_fungi_samples
  resources :nonvascular_plant_samples
  resources :soil_samples
  resources :species_variation_observations
  resources :tree_samples

  resources :plots do
    member do
      delete :delete_plot_image_attachment
    end
  end

  resources :plants do
    member do
      delete :delete_plant_image_attachment
    end
  end
end
