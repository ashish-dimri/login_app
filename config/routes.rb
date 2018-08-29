Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :albums do
  	resources :photos do
  		resources :tags
  	end
  end
  root 'albums#index'
end
