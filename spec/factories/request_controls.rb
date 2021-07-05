FactoryBot.define do
  factory :request_control do
    remote_ip { "127.0.0.1" }
    max_request_origin_ip { 10 }
    destination_path { "/services2" }
    email { "carlos@hotmail.com.br" }
    token { "123sdas13ea" }
    acceptance_criteria { "remote_ip,destination_path" }
  end
end
