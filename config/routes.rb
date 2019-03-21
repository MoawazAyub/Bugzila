Rails.application.routes.draw do
  get 'bugs/index'
  get 'bugs/create'
  get 'bugs/edit'
  get 'bugs/new'
  get 'bugs/show'
  get 'bugs/update'
  #get 'projects/index'
  #get 'projects/new'
  #get 'projects/edit'
  #get 'projects/show'
  #get 'projects/create'
  resources :projects do
  	resources :bugs
  end
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'dashboard#index'
end
