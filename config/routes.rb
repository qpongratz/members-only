Rails.application.routes.draw do
  resources :posts, except: %i[show, edit, update]
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'posts#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
