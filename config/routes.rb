Rails.application.routes.draw do  
  namespace :api do
    namespace :v1 do
      resources :contents
      resources :users
      post 'auth/signin', to: 'sessions#create'
      post 'users/signup', to: 'users#create'
      get '/users', to: 'users#index'
    end
  end
end
