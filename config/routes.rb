Feedbackly::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  root :to => "feedbacks#new"
  resources :feedbacks
  resources :users
  resources :sessions
  
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  get "pending_users/:secret" => "pending_users#show"
  
end
