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
  post '/login', to: 'sessions#login'
  delete '/logout', to: 'sessions#logout'
  get '/contact', to:"static_pages#contact", as: "contact"
  get '/about',   to:"static_pages#about",   as: "about"
  
  get '/login', to: 'users#login'

  resources :activations, only:[:edit]
  resources :password_resets, only:[:new,:create, :edit, :update]
     
  resources :users do
    resources :receipts
    resources :posts
  end
  get '/most_expensive_receipts', to:"receipts#expensive"
  
  resources :budgets
  
  
  
  
  

end
