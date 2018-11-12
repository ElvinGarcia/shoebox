Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "application#index"
  get '/auth/:provider/callback' => 'sessions#create'
  post '/auth/:provider/callback' => 'sessions#create', as: :session_callback
  resources :users
   delete '/logout', to: 'sessions#logout'
  
   get '/login', to: 'users#login'
  
   post 'sessions/login', to: 'sessions#login'
  

   get "post/:user/:pic_id", to: "posts#show" ,as: "post"
   delete "post/:pic_id", to: "posts#delete" , as:"post_delete"

   get '/contact', to:"application#contact", as: "contact"
   get '/about',   to:"application#about",   as: "about"

  
  
end
