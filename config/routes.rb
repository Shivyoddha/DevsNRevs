Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
   get '/home/show', to: 'home#show'
post 'home/submit_form', to: 'home#submit_form'
get 'home/show.pdf', to: 'home#show', format: 'pdf'
  # Defines the root path route ("/")
   get 'home/index'
   root "home#landing"
 get 'home/landing'
 get 'home/mobile', to: 'home#mobile'
 get 'home/pet_report1', to: 'home#pet_report1'
 get 'fetch_dog_facts', to: 'home#fetch_dog_facts'
 get 'home/submit_form'
 post 'home/show.pdf', to: 'home#show', format: 'pdf'
end
