Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  
  namespace :api do
    namespace :v1 do
      resources :doctors, only: %w[index] do
        get 'exams', controller: :doctors, action: :exams
      end
      resources :exams, only: %w[index]
      resources :patients, only: %w[index] do
        get 'exams', controller: :patients, action: :exams
      end
      post 'exams/import', controller: :exams
    end
  end
end
