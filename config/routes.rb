Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
   get '/home/show', to: 'home#show'
  # Defines the root path route ("/")
   get 'home/index'
   root "home#index"
end
