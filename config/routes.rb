Rails.application.routes.draw do
  resources :users
  namespace :api do 
    namespace :v1 do 
      # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
      post 'authenticate', to: 'authentication#authenticate'
    end 
  end
end
