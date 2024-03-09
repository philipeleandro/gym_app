# frozen_string_literal: true

Rails.application.routes.draw do
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  root 'home#index'

  # users
  get '/users', to: 'users#index'
  get '/users/new', to: 'users#new'
  post '/users', to: 'users#create'
  delete '/users/:id', to: 'users#destroy', as: 'user_delete'

  # training_plans
  get '/user_training_plans/:user_id', to: 'training_plans#user_plans_list', as: 'user_training_plans'
end
