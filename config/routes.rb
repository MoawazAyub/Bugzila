Rails.application.routes.draw do
  #get 'projects/index'
  #get 'projects/new'
  #get 'projects/edit'
  #get 'projects/show'
  #get 'projects/create'
  resources :projects
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'dashboard#index'
end
