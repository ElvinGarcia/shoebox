Rails.application.routes.draw do
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'admin' do
    resources :articles
  end

  root to: "static_pages#index"
  get '/auth/:provider/callback' => 'sessions#login'
  get '/contact', to:"static_pages#contact", as: "contact"
  get '/about',   to:"static_pages#about",   as: "about"
  post '/login', to: 'sessions#login'
  delete '/logout', to: 'sessions#logout'
  resources :users
  resources :posts
  get '/login', to: 'users#login'
  
  
  
  
  
  
  
  


  
  
end
