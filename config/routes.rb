Rails.application.routes.draw do
  # Campaign Routes
  resources :campaigns
  # Root Url
  root :to => 'index#index'
end
