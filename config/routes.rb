Rails.application.routes.draw do
  root "main#index"
  get "signup" => "users#new"
  get "login" => "sessions#new"
  get "logout" => "sessions#destroy"
  resources :users, except: %i[index new]
  resources :sessions, except: %i[index edit update show new destroy]
  resources :phone_numbers
  resources :people
  resources :emails
  resources :addresses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
