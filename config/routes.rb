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
  get '/users/:user_id/training_plans/new', to: 'training_plans#new', as: 'training_plan_new'
  post '/users/:user_id/training_plans/new', to: 'training_plans#create'
  get '/user_training_plans/:user_id', to: 'training_plans#user_plans_list', as: 'user_training_plans'
  delete '/users/:user_id/training_plans/:id', to: 'training_plans#destroy', as: 'user_plans_delete'
  get '/users/:user_id/training_plans/:id/edit', to: 'training_plans#edit', as: 'user_plans_edit'
  patch '/users/:user_id/training_plans/:id/edit', to: 'training_plans#update'

  # muscle_groups
  get '/muscle_groups/:training_plan_id', to: 'muscle_groups#user_muscle_group_list', as: 'user_muscle_group_list'
  get '/training_plans/:training_plan_id/muscle_groups/new', to: 'muscle_groups#new', as: 'muscle_groups_new'
  post '/training_plans/:training_plan_id/muscle_groups/new', to: 'muscle_groups#create'
end
