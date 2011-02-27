Portfolio::Application.routes.draw do
  devise_for :users
  
  root :to => 'projects#homepage'
  
  resources :posts
  resources :tags
  resources :projects
  
  match '/admin', :to => 'Admin::Dashboard#index' 
  namespace :admin do
    resources :posts
    resources :assets
    resources :headers
    resources :projects
  end
  
end
