Rails.application.routes.draw do
  get 'tools/tagging'
  get 'tools/keywords'
  get 'tools/page_inspect'
  get 'tools/speed_insights'
  get 'tools/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
  }
  devise_scope :user do
    # Redirests signing out users back to sign-in
    get "users", to: "users/sessions#new"
  end
  get 'home/index'
  get 'home/about'
  get 'home/contact'
  get 'home/privacy_policy'
  get 'home/terms_conditions'
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'search' => 'home#search'
end
