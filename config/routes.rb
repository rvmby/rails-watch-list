Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :lists do
    resources :bookmarks, only: %i[new create]
  end
  # when id is needed, no nesting
  resources :bookmarks, only: %i[destroy]
end
