Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  
  namespace :api do
    namespace :v1 do
      resources :doctors, only: %w[index] do
        resources :exams, only: [:index], controller: 'doctors/exams'
      end
      resources :exams, only: %w[index] do
        collection do
          post 'import'
          get 'import/:token/status', action: :import_status, as: 'import_status'
        end
      end
      resources :patients, only: %w[index] do
        resources :exams, only: [:index], controller: 'patients/exams'
      end
    end
  end
end
