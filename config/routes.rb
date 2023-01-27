Rails.application.routes.draw do
  
  get "signup" => "users#new"
  get "login" => "sessions#new"
  delete "logout" => "sessions#destroy"
  resources :users do   
  resources :comments
  end
  
  resources :sessions, except:[:index, :edit, :update, :show, :new, :destroy]
  

   root "home#index"
end
