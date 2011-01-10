Portfolio::Application.routes.draw do
  devise_for :users
  
  root :to => 'posts#index'
  
  resources :posts
  resources :tags
  
  match '/admin', :to => 'Admin::Dashboard#index' 
  namespace :admin do
    resources :posts
    resources :assets
    resources :headers
    resources :projects
  end

  namespace :ckeditor do
    resources :pictures, :only => [:index, :create, :destroy]
    resources :attachments, :only => [:index, :create, :destroy]
  end
  
end
