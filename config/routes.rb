Rails.application.routes.draw do
  devise_for :users
  resources :profiles, only: :show
  resources :projects do
    resources :responsibilities do
      put :accept, on: :member
    end
    resources :projects
  end
  root to: "home#index"
end
