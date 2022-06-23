Rails.application.routes.draw do
  resources :blogs
  resources :sessions, only: %i[new create destroy]
  resources :users, only: %i[new show create]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
