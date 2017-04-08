Rails.application.routes.draw do
  root 'static_pages#home'
  get 'signup' => 'admins#new'
end
