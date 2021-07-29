Rails.application.routes.draw do
  root 'pages#home'
  get 'about' , to:"pages#about"
  resources :articles , only: [:index,:show,:edit,:destroy,:update,:new,:create]
  get 'signup' , to:"users#new"
  resources :users, except: [:new]
  #post 'articles/new' , to:"articles#create"
end