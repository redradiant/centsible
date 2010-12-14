  require File.expand_path('../boot', __FILE__)

  require 'rails/all'

  # If you have a Gemfile, require the gems listed there, including any gems
  # you've limited to :test, :development, or :production.
  Bundler.require(:default, Rails.env) if defined?(Bundler)

  require File.expand_path('../../lib/appconf', __FILE__)
  Appconf.loadme!

  module Centsible
  class Application < Rails::Application
  require 'spree_site'
  config.middleware.use "RedirectLegacyProductUrl"
  config.middleware.use "SeoAssist"
  #    ActionMailer::Base.smtp_settings = {
  #        :address        => "smtp.sendgrid.net",
  #        :port           => "25",
  #        :authentication => :plain,
  #        :user_name      => (Appconf.sendgrid.username rescue ENV['SENDGRID_USERNAME']),
  #        :password       => (Appconf.sendgrid.password rescue ENV['SENDGRID_PASSWORD']),
  #        :domain         => (Appconf.sendgrid.domain rescue ENV['SENDGRID_DOMAIN'])
  #      }

  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.

  # Custom directories with classes and modules you want to be autoloadable.
  config.autoload_paths += %W( #{config.root}/app/loadable #{config.root}/vendor/loadable 
    #{config.root}/features/support/lib  #{config.root}/features/support/helpers )
  # Only load the plugins named here, in the order given (default is alphabetical).
  # :all can be used as a placeholder for all plugins not explicitly named.
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

  # Preload these files.
  require 'app_logger'
  $debug = AppLogger.new(:debug)

  require 'batch_loader'    
  #    batch_load('lib/**/*.rb')

  # Activate observers that should always be running.
  # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
  config.time_zone = 'UTC'

  # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
  # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
  # config.i18n.default_locale = :de

  # JavaScript files you want as :defaults (application.js is always included).
  # config.action_view.javascript_expansions[:defaults] = %w(jquery rails)

  # Configure the default encoding used in templates for Ruby 1.9.
  config.encoding = "utf-8"

  # Configure sensitive parameters which will be filtered from the log file.
  config.filter_parameters += [:password]

  config.action_mailer.delivery_method = :smtp

  config.action_view.stylesheet_expansions[:admin] = %w(admin/niceforms-default.css admin/scaffold.css admin/style.css)
  config.action_view.javascript_expansions[:admin] = %w(admin/clockh.js admin/clockp.js admin/ddaccordion.js admin/jquery-1.4.2.min.js admin/jquery.min.js admin/niceforms.js)

  config.generators do |g|
  g.orm             :active_record
  g.template_engine :erb
  #      g.test_framework  :rspec, :fixture => true
  g.fixture_replacement "machinist"
end

#initializer "load_custom_application_configuration", :after => :disable_dependency_loading do |a|
#Appconf.loadme!
#batch_load('lib/autoload/**/*.rb')
#      end

    end
  end

