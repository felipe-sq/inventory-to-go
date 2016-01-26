Rails.application.routes.draw do
  resources :departments do
    resources :items, only: [:index, :create, :update, :destroy]
  end
end
