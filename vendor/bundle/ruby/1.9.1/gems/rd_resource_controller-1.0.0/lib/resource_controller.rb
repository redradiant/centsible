module ResourceController
  ACTIONS           = [:index, :show, :new_action, :create, :edit, :update, :destroy].freeze
  SINGLETON_ACTIONS = (ACTIONS - [:index]).freeze
  FAILABLE_ACTIONS  = ACTIONS - [:index, :new_action, :edit].freeze
  NAME_ACCESSORS    = [:model_name, :route_name, :object_name]

  autoload :Accessors,              'resource_controller/accessors'
  autoload :ActionOptions,          'resource_controller/action_options'
  autoload :Actions,                'resource_controller/actions'
  autoload :Base,                   'resource_controller/base'
  autoload :Controller,             'resource_controller/controller'
  autoload :FailableActionOptions,  'resource_controller/failable_action_options'
  autoload :Helpers,                'resource_controller/helpers'
  autoload :ResponseCollector,      'resource_controller/response_collector'
  autoload :Singleton,              'resource_controller/singleton'
  autoload :Urligence,              'urligence'
  class Railtie < Rails::Railtie
  end
end

class ActionController::Base

  def self.resource_controller(*args)
    include ResourceController::Controller
    include ResourceController::Urligence
    helper_method :smart_url

    if args.include?(:singleton)
      include ResourceController::Helpers::SingletonCustomizations
    end
  end

  # Use this method in your controller to specify which actions you'd like it to respond to.
  #
  #   class PostsController < ResourceController::Base
  #     actions :all, :except => :create
  #   end
  def self.actions(*opts)
    config = {}
    config.merge!(opts.pop) if opts.last.is_a?(Hash)

    all_actions = (singleton? ? ResourceController::SINGLETON_ACTIONS : ResourceController::ACTIONS) - [:new_action] + [:new]

    actions_to_remove = []
    actions_to_remove += all_actions - opts unless opts.first == :all
    actions_to_remove += [*config[:except]] if config[:except]
    actions_to_remove.uniq!

    actions_to_remove.each { |action| undef_method(action) if method_defined?(action) }
  end

end


