Rails.application.routes.draw do
  resources :departments do
    resources :items
  end
end
