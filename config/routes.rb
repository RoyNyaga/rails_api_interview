Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
      post 'authenticate', to: 'authentication#authenticate'
      resources :users
      resources :posts
    end 
  end
end
