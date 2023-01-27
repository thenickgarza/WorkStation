Rails.application.routes.draw do
  
  get "signup" => "users#new"
  get "login" => "sessions#new"
  delete "logout" => "sessions#destroy"
  resources :users  
    resources :comments
  
  resources :sessions, except:[:index, :edit, :update, :show, :new, :destroy]
  

   root "home#index"
end
