class RequestControl < ApplicationRecord
  validates_presence_of :max_request_origin_ip
  validates_presence_of :period_seconds
end
