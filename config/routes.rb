Feedbackly::Application.routes.draw do
  get "feedback/new"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  root :to => "feedbacks#new"
  resources :feedbacks

end
