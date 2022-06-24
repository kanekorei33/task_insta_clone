Rails.application.routes.draw do
  resources :pictures do
    collection do
      post :confirm
    end
  end
  resources :sessions, only: %i[new create destroy]
  resources :users
  resources :favorites, only: %i[create destroy]
end
