Rails.application.routes.draw do
#  resources :visitors, only: [:new]
  #get "/pages/*id" => 'pages#show'
  resources :visitors, only: [:new, :create]
  root to: 'visitors#new'
end
