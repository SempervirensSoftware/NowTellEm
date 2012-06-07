Feedbackly::Application.routes.draw do
  get "feedback/new"

  # The priority is based upon order of creation:
  # first created -> highest priority.


  match 'feedback' => 'feedback#new'

end
