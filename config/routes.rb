Rails.application.routes.draw do
  devise_for :users
  resources :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  resources :books
  
 
end
