Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  namespace :api do
    namespace :v1 do
      get '/services2', to: 'photos#show'
      resources :request_controls, only: %i[create update]
    end
  end
end
