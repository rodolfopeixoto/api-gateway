class RequestInformationSerializer
  include JSONAPI::Serializer
  attributes :client_ip, :path, :status_code
end
