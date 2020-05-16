Rails.application.routes.draw do
  
  # get 'tags/edit'
  # get 'contents/index'
  # get 'contents/show'
  # get 'contents/new'
  # get 'contents/edit'
  
  root 'contents#index'
  resources :contents do
    resources :tags
  end
  resources :mytests
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
