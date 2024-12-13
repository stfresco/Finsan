Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get 'dashboard', to: 'dashboard#index', as: :dashboard
  get '/home', to: 'home#index', as: 'home'
  get '/login', to: 'home#login', as: 'login'
  get "goals/my_transaction", to: "goals#my_transaction"
  post "create_goal_transaction", to: "goals#create_goal_transaction"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  resources :my_transactions, only: [:destroy, :update, :edit, :index, :show]
  get 'all_transactions', to: 'my_transactions#all_transactions'

  resources :accounts do
    resources :my_transactions, only: [:edit, :update, :index, :new, :create, :destroy]
  end

  resources :balances, only: [:edit, :update, :show]
  resources :goals
  resources :questions, only: [:index, :create]

end
