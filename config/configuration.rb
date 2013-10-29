module Sinatra
  # This Sinatra extension let you set up configuration to be used in your
  # application.
  # You can include environment specific configuration using a configure
  # block.
  # In order to load the configuration in your application, you need to
  # register the extension and call the load_configuration method.
  module Configuration
    def self.registered(base)
      base.set :environments, %w(test development production)
    end

    def load_configuration
      enable :logging
      file = File.new("#{settings.root}/log/#{settings.environment}.log", 'a+')
      file.sync = true
      use Rack::CommonLogger, file

      set :method_override, true

      set :redis_data_endpoint, "redis://localhost:6379/0"
      set :redis_worker_endpoint, "redis://localhost:6379/1"

      # specific development config
      configure :development do
        require 'better_errors'
        use BetterErrors::Middleware
        BetterErrors.application_root = settings.root

        enable :dump_errors
      end

      # specific test config
      configure :test do
      end

      # specific production config
      configure :production do
        disable :dump_errors
      end
    end
  end

  register Configuration
  Delegator.delegate :load_configuration
end
