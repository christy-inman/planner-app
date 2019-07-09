Rails.application.routes.draw do
  get 'sessions/login'
  post 'sessions/login' 
  post 'sessions/loginattempt'
  get 'sessions/home'
  get 'sessions/profile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  root 'users#index'
end
