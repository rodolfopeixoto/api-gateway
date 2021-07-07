FactoryBot.define do
  factory :request_information do
    client_ip { '127.0.0.1' }
    path { '/api-docs' }
    status_code { '301' }
  end
end
