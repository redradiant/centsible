require File.expand_path('../boot', __FILE__)

require 'rails/all'

# If you have a Gemfile, require the gems listed there, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default) 
Bundler.require(Rails.env) unless Rails.env.test? 

module TestApp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here

    # Skip frameworks you're not going to use (only works if using vendor/rails)
    # config.frameworks -= [ :action_web_service, :action_mailer ]

    # Only load the plugins named here, by default all plugins in vendor/plugins are loaded
    # config.plugins = %W( exception_notification ssl_requirement )

    # Add additional load paths for your own custom dirs
    # config.load_paths += %W( #{RAILS_ROOT}/../lib )

    # Force all environments to use the same logger level
    # (by default production uses :info, the others :debug)
    # config.log_level = :debug


    # Use SQL instead of Active Record's schema dumper when creating the test database.
    # This is necessary if your schema can't be completely dumped by the schema dumper,
    # like if you have constraints or database-specific column types
    # config.active_record.schema_format = :sql

    # Activate observers that should always be running
    # config.active_record.observers = :cacher, :garbage_collector

    # Make Active Record use UTC-base instead of local time
    # config.active_record.default_timezone = :utc

    # See Rails::Configuration for more options
  end
end
