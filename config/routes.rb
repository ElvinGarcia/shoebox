Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/auth/:provider/callback' => 'sessions#create'
  resource :users
  resource :stores do
    resources :receipts
  end

  root to: "application#index"
  
end
