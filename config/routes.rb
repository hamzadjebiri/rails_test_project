Rails.application.routes.draw do
  root 'pages#home'
  get 'about' , to:"pages#about"
  resources :articles , only: [:index,:show,:edit,:destroy,:update,:new,:create]
  #post 'articles/new' , to:"articles#create"
end