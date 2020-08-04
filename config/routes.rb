Rails.application.routes.draw do
  root 'pages#landing_page'
  resources :enneagram_scores, :pages
  resources :checkouts, only: [:new, :create]
  resources :responses do
    collection do
      delete 'remove_all'
    end
  end
  get 'test' => 'responses#new'

  resources :questions
  devise_for :users
  resources :enneagram_numbers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'pages/landing_page'

end
