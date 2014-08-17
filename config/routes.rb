Rails.application.routes.draw do
#  resources :visitors, only: [:new]
  #get "/pages/*id" => 'pages#show'
  root to: 'visitors#new'
end
