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
    end
  end

  resources :pictures do
    member do
      post :like, :unlike
    end
  end
end
