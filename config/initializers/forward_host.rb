class ForwardHost < Rack::Proxy

  PATHS_NOT_FORWARD_HOST = %r{/api/v1|/api-docs}.freeze

  def perform_request(env)
    @rack_request = Rack::Request.new(env)
    if @rack_request.path =~ PATHS_NOT_FORWARD_HOST
      @backend = URI(ENV['URL_PROJECT'])
      @app.call(env)
    else
      @backend = URI(ENV['SERVICE_URL'])
      env['HTTP_HOST'] = @backend.host
      super(env)
    end
  end

  def rewrite_response(triplet)
    status, _headers, _body = triplet
    RequestInformation.create(
      client_ip: @rack_request.ip,
      path: @rack_request.path,
      status_code: status
    )
    triplet
  end

  private

  attr_reader :rack_request, :backend
end

Rails.application.config.middleware.use Rack::Attack
Rails.application.config.middleware.use ForwardHost, backend: ENV['SERVICE_URL'], streaming: false
