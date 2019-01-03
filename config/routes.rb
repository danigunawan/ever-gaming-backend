Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # localhost:3000/api/v1/login

  namespace :api do
    namespace :v1 do
      resources :users, :playlists
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      # get '/playlist/:id', to: 'playlists#show'
      # post '/playlist', to: 'playlists#create'
    end
  end

end
