Rails.application.routes.draw do
  resources :admins

  resources :departments do
    resources :items, only: [:index, :create, :update, :destroy]
  end
end
