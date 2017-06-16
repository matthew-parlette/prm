Rails.application.routes.draw do
  resources :contacts do
    resources :jobs
  end
  resources :job_statuses do
    resources :jobs
  end
  resources :jobs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
