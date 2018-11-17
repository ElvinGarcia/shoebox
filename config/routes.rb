Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "static_pages#index"
  get '/contact', to:"static_pages#contact", as: "contact"
  get '/about',   to:"static_pages#about",   as: "about"
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#logout'
  resources :users
  
  get '/auth/:provider/callback' => 'sessions#login'
  
  
  
  
  


  
  
end
