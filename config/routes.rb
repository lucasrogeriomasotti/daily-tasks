Rails.application.routes.draw do
  resources :daily_tasks
 
  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }
  
  root to: "home#index"
end
