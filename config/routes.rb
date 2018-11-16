Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "application#index"
   get '/auth/:provider/callback' => 'sessions#login'
   #post '/auth/:provider/callback' => 'sessions#create', as: :session_callback
  
  resources :users
  get '/login', to: 'users#login'
  post 'sessions/login', to: 'sessions#login'
  delete '/logout', to: 'sessions#logout'
  get '/contact', to:"application#contact", as: "contact"
  get '/about',   to:"application#about",   as: "about"
  


  
  
end
