numbers = (1..30).to_a
acceptance_criteria = %w[remote_ip destination_path email token]
max_request_origin_ip = (3..6).to_a

numbers.each do |number|
  params = {
    "remote_ip": "127.0.0.#{number}",
    "max_request_origin_ip": max_request_origin_ip.sample,
    "destination_path": "/api/v1/services#{number + 1}",
    "email": "carlos#{number}@hotmail.com.br",
    "token": '123sdas13ea',
    "acceptance_criteria": acceptance_criteria.sample,
    "period_seconds": 2
  }

  RequestControl.create(params)
end
