limit_proc_email = proc do |request|
  control = RequestControl.find_by(email: request.params['email'])

  control.present? ? control.max_request_origin_ip : 0
end

Rack::Attack.throttle('limit per email', limit: limit_proc_email, period: 1) do |request|
  request_control_email = RequestControl.find_by(email: request.params['email'])
  request.params['email'].to_s.downcase.gsub(/\s+/, '') if request_control_email.present?
end

limit_proc_ip = proc do |request|
  control = RequestControl.find_by(remote_ip: request.ip)

  control.present? ? control.max_request_origin_ip : 0
end

Rack::Attack.throttle('limit per ip', limit: limit_proc_ip, period: 1) do |request|
  request_control_email = RequestControl.find_by(remote_ip: request.ip)
  request.ip if request_control_email.present?
end

limit_proc = proc do |request|
  control = RequestControl.find_by(destination_path: request.path)
  control.present? ? control.max_request_origin_ip : 0
end

Rack::Attack.throttle('limit path per ip', limit: limit_proc, period: 1) do |request|
  request_control_destination_path = RequestControl.find_by(destination_path: request.path)
  request.path if request_control_destination_path.present?
end
