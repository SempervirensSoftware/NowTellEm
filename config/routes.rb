Feedbackly::Application.routes.draw do
  get "unsubscribes/show"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  root :to => "feedbacks#new"
  resources :feedbacks
  resources :users
  resources :sessions
  
  get "about" => "feedbacks#about", :as => "about"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "pending_users/:secret" => "pending_users#show"
  get "unsubscribe/:token" => "unsubscribes#show"
  get "unsubscribe/resubscribe/:token" => "unsubscribes#resubscribe"
  
end
