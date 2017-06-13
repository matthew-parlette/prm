Rails.application.routes.draw do
  resources :job_statuses
  resources :jobs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
