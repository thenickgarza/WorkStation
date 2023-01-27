Rails.application.routes.draw do
  
  get "signup" => "users#new"
  get "login" => "sessions#new"
  delete "logout" => "sessions#destroy"
  resources :users, except: [:index, :new]
  resources :sessions, except:[:index, :edit, :update, :show, :new, :destroy]
  root "people#index"

   root "home#index"
end
