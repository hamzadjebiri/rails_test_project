Rails.application.routes.draw do
  root 'pages#home'
  get 'about' , to:"pages#about"
  resources :articles , only: [:index,:show,:edit,:destroy,:update,:new,:create]
  get 'signup' , to:"users#new"
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  #post 'articles/new' , to:"articles#create"
end