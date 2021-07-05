require_relative "boot"

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_view/railtie"

Bundler.require(*Rails.groups)

module ApiGateway
  class Application < Rails::Application
    # $count = 0
    config.load_defaults 6.1
    config.api_only = true
  end
end
