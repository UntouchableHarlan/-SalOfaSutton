Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  post '/tweet' => 'static#tweet'
  get '/tweet' => 'static#index'

  root 'static#index'

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
