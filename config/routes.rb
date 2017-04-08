Rails.application.routes.draw do
  get 'static_pages/home'

  root 'welcome#index'
end
