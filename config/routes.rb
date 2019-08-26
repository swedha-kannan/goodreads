Rails.application.routes.draw do

  root to: 'ebooks#index' 


resources :users, only: [:new, :create]

resources :user_sessions, only: [:create, :destroy]

delete '/sign_out', to: 'user_sessions#destroy', as: :sign_out
get '/sign_in', to: 'user_sessions#new', as: :sign_in

  resources :users do
    resources :user_ebooks
  end
  resources :users do
    resources :ebooks
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
