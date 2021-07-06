class ForwardHost < Rack::Proxy
  def perform_request(env)
    request = Rack::Request.new(env)
    if request.path =~ %r{/api/v1/request_controls|/api-docs}
      @backend = URI(ENV['URL_PROJECT'])
      @app.call(env)
    else
      @backend = URI(ENV['SERVICE_URL'])
      env['HTTP_HOST'] = @backend.host
      super(env)
    end
  end
end

Rails.application.config.middleware.use ForwardHost, backend: ENV['SERVICE_URL'], streaming: false
