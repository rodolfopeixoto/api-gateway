class RequestInformation < ApplicationRecord
  scope :amount_of_status, ->(status) { where(status_code: status).size }
  scope :amount_of_paths, ->(path) { where(path: path).size }
  scope :amount_of_ips, ->(ip) { where(client_ip: ip).size }
end
