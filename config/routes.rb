Rails.application.routes.draw do
  get 'tools/tagging'
  get 'tools/keywords'
  get 'tools/page_inspect'
  get 'tools/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
  }
  get 'home/index'
  get 'home/about'
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'search' => 'home#search'
end
