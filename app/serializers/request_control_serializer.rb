class RequestControlSerializer
  include JSONAPI::Serializer
  attributes :remote_ip, :max_request_origin_ip, :destination_path, :email, :token, :acceptance_criteria
end
