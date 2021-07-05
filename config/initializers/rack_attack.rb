block_list_paths = [
  '/api/v1/services2',
  '/api/v1/services3',
  '/api/v1/services4'
]

Rack::Attack.blocklist 'bad_ips from logging in' do |request|
  block_list_paths.include?(request.path)
end
