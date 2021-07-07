class RequestInformation < ApplicationRecord
  STATUS_CODE_TOO_MANY_REQUESTS = '429'

  scope :amount_of_status, ->(status) { where(status_code: status).size }
  scope :amount_of_paths, ->(path) { where(path: path).size }
  scope :amount_of_ips, ->(ip) { where(client_ip: ip).size }
  scope :amount_of_many_requests, -> { where(status_code: STATUS_CODE_TOO_MANY_REQUESTS).size }
end
