ActivrDemo::Application.routes.draw do
  root :to => "home#index"

  devise_for :users

  resources :users do
    member do
      post :follow, :unfollow
    end
  end

  resources :albums do
    member do
      post :follow, :unfollow
      get :new_photo
      post :create_photo
    end
  end

  resources :pictures do
    member do
      post :like, :unlike
      post :add_to_album
    end
  end
end
