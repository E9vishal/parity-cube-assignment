ParityCube::Application.routes.draw do
  
  resources :albums
  resources :photos, :except => [:index, :show]
  
  get 'my-profile' => "home#my_profile", :as => :my_profile

  devise_for :users

  root :to => "home#index"
  match "*path", :to => "home#routing_error"
  
end
