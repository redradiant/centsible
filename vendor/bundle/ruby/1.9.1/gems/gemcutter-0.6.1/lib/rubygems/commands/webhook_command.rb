require 'rubygems/local_remote_options'
require 'rubygems/gemcutter_utilities'

class Gem::Commands::WebhookCommand < Gem::Command
  include Gem::LocalRemoteOptions
  include Gem::GemcutterUtilities

  def description
    <<-EOF
Webhooks can be created for either specific gems or all gems. In both cases
you'll get a POST request of the gem in JSON format at the URL you specify in
the command. You can also use this command to test fire a webhook for any gem.
EOF
  end

  def arguments
    "GEM_NAME       name of gem to register webhook for, or omit to list hooks."
  end

  def usage
    "#{program_name} [GEM_NAME]"
  end

  def initialize
    super 'webhook', "Register a webhook that will be called any time a gem is updated on Gemcutter."
    option_text = "The URL of the webhook to"

    add_option('-a', '--add URL', "#{option_text} add") do |value, options|
      options[:send] = 'add'
      options[:url] = value
    end

    add_option('-r', '--remove URL', "#{option_text} remove") do |value, options|
      options[:send] = 'remove'
      options[:url] = value
    end

    add_option('-f', '--fire URL', "#{option_text} testfire") do |value, options|
      options[:send] = 'fire'
      options[:url] = value
    end

    add_option('-g', '--global', "Apply hook globally") do |value, options|
      options[:global] = true
    end

    add_proxy_option
  end

  def execute
    sign_in

    if options[:url]
      name = options[:global] ? '*' : get_one_gem_name
      send("#{options[:send]}_webhook", name, options[:url])
    else
      list_webhooks
    end
  end

  def add_webhook(name, url)
    say "Adding webhook..."
    make_webhook_request(:post, name, url)
  end

  def remove_webhook(name, url)
    say "Removing webhook..."
    make_webhook_request(:delete, name, url, "api/v1/web_hooks/remove")
  end

  def fire_webhook(name, url)
    say "Test firing webhook..."
    make_webhook_request(:post, name, url, "api/v1/web_hooks/fire")
  end

  def list_webhooks
    resp = rubygems_api_request(:get, "api/v1/web_hooks.yaml") do |request|
      request.add_field("Authorization", Gem.configuration.rubygems_api_key)
    end

    with_response(resp) do |response|
      begin
        groups = YAML.load(response.body)

        if groups.size.zero?
          say "You haven't added any webhooks yet."
        else
          groups.each do |group, hooks|
            if options[:global]
              next if group != "all gems"
            elsif options[:args] && options[:args].first
              next if group != options[:args].first
            end

            say "#{group}:"
            hooks.each do |hook|
              say "- #{hook['url']}"
            end
          end
        end
      rescue Exception => error
        say "There was a problem parsing the data:"
        say error.to_s
        terminate_interaction
      end
    end
  end

  def make_webhook_request(method, name, url, api = "api/v1/web_hooks")
    response = rubygems_api_request(method, api) do |request|
      request.set_form_data("gem_name" => name, "url" => url)
      request.add_field("Authorization", Gem.configuration.rubygems_api_key)
    end

    with_response(response)
  end
end
