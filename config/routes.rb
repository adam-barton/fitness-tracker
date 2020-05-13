Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :workouts do
    resources :exercises
  end
  resources :exercises

  
  root 'users#show'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/signout' => 'sessions#destroy'
  delete "/signout", to: "sessions#destroy"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
