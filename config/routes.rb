Rails.application.routes.draw do
  resources :reviews
  resources :events do 
    resources :reviews, only: [:index, :new]
  end
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'events#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
