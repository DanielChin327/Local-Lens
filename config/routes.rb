Rails.application.routes.draw do
  root 'posts#index'
  # Custom routes for user sign up and session management
  get 'signup', to: 'users#new', as: 'signup'   # For user registration form
  post 'signup', to: 'users#create'            # To handle form submission for registration

  get 'login', to: 'sessions#new', as: 'login'  # For login form
  post 'login', to: 'sessions#create', as: 'session'  # To handle form submission for login
  delete 'logout', to: 'sessions#destroy', as: 'logout'  # For logging out

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "home#index"  # You can uncomment this and set it to whichever controller#action you want as your home page

  # RESTful routes for users
  resources :users, only: [:show, :new, :create]

  resources :posts
end
