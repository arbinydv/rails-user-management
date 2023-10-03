Rails.application.routes.draw do  
  namespace :api do
    namespace :v1 do
      resources :contents
      resources :users
      post 'auth/signin', to: 'sessions#create'
      post 'users/signup', to: 'users#create'

      post '/contents', to: 'contents#create'
      get '/content', to: 'contents#show'
      put '/contents/:id', to: 'contents#update'
      delete '/contents/:id', to: 'contents#destroy'
    end
  end
end
