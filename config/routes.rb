Rails.application.routes.draw do


  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/sign_out' => 'sessions#destroy'
  # get '/sign_up', to: 'users#new'

  root :to => 'welcome#index'

  resources :rides

  resources :attractions

  resources :users#, :except => :new


end
