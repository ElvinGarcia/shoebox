Rails.application.routes.draw do
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # namespace 'users' do
  #   resources :articles
  #   resources :comments
  # end

#   scope "/admin" do
#   resources :stats, only: [:index]
# end
  

  root to: "static_pages#index"
  get '/auth/:provider/callback' => 'sessions#login'
  get '/login', to: 'users#login'
  get '/contact', to:"static_pages#contact", as: "contact"
  get '/about',   to:"static_pages#about",   as: "about"
  post '/login', to: 'sessions#login'
  delete '/logout', to: 'sessions#logout'
  
   resources :users do
    resources :posts
  end

  
  
  
  

end
