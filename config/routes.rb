Rails.application.routes.draw do
  resources :enneagram_scores
  resources :responses
  resources :questions
  devise_for :users
  root to:'enneagram_numbers#index'
  resources :enneagram_numbers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
