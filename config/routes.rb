Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/auth/:provider/callback' => 'sessions#create'
  post '/auth/:provider/callback' => 'sessions#create', as: :session_callback
  delete '/logout', to: 'sessions#logout'
  
  get '/login', to: 'users#login'
  
  post 'sessions/login', to: 'sessions#login'
  resource :users

  get "receipt/:user/:pic_id", to: "receipts#show" ,as: "receipt"
  delete "receipt/:pic_id", to: "receipts#delete" , as:"receipt_delete"

  get '/contact', to:"application#contact", as: "contact"
  get '/about',   to:"application#about",   as: "about"

  root to: "application#index"
  
end
