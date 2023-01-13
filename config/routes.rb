Rails.application.routes.draw do
  devise_for :users
  resources :users, :only => [:show, :edit, :update]
  
  get 'tops/home'
  root 'tops#home'
  
  resources :rooms do
    collection do
      get :search
    end
  end  


  resources :reservations do
    collection do
      post :confirm
    end
  end

  get 'rooms/post/:id', to: 'rooms#post'
  get 'users/post/:id', to: 'users#post'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end