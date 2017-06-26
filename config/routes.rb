Rails.application.routes.draw do
  resources :tasks
  resources :task_categories
  resources :daily_tasks
 
  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }
  
  root to: "home#index"
end
