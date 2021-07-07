Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  namespace :api do
    namespace :v1 do
      resources :request_controls, only: %i[index create update]
      get 'amount_of_status', to: 'request_informations#amount_of_status'
      get 'amount_of_paths', to: 'request_informations#amount_of_paths'
      get 'amount_of_ips', to: 'request_informations#amount_of_ips'
    end
  end
end
