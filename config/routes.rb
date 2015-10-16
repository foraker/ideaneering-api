Rails.application.routes.draw do
  resources :votes
  resources :comments
  resources :ideas

  resources :tokens, only: :create
end
