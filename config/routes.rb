Rails.application.routes.draw do
  resources :tasks
  resources :task_categories
  resources :task_logs
 
  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }
  
  root to: "home#index"
end
