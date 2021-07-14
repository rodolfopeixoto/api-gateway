limit_proc_email = proc do |request|
  request_control_by_email(request.params['email'])
  @request_control_by_email.present? ? @request_control_by_email.max_request_origin_ip : 0
end

Rack::Attack.throttle('limit per email', limit: limit_proc_email, period: 1.second) do |request|
  request_control_by_email(request.params['email'])
  request.params['email'].to_s.downcase.gsub(/\s+/, '') if @request_control_by_email.present?
end


limit_proc = proc do |request|
  request_control_by_path(request.path)
  @request_control_by_path.present? ? @request_control_by_path.max_request_origin_ip : 0
end


Rack::Attack.throttle('limit path per ip', limit: limit_proc, period: 1.second) do |request|
  request_control_by_path(request.path)
  request.path if @request_control_by_path.present?
end


limit_proc_ip = proc do |request|
  request_control_by_ip(request.ip)
  @request_control_by_ip.present? ? request_control_by_ip.max_request_origin_ip : 0
end

Rack::Attack.throttle('limit per ip', limit: limit_proc_ip, period: 1.second) do |request|
  request_control_by_ip(request.ip)
  request.ip if @request_control_by_ip.present?
end

def request_control_by_email(email)
  @request_control_by_email ||= RequestControl.find_by(email: email)
end

def request_control_by_path(path)
  @request_control_by_path ||= RequestControl.find_by(destination_path: path)
end

def request_control_by_ip(ip)
  @request_control_by_ip ||= RequestControl.find_by(remote_ip: ip)
end
