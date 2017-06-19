Rails.application.routes.draw do
  resources :daily_tasks
  devise_for :users
  root to: "home#index"
end
