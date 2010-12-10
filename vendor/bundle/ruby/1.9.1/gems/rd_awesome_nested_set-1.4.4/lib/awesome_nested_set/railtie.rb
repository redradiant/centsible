# encoding: utf-8
require 'awesome_nested_set'

module CollectiveIdea
  module Acts
    module NestedSet
      if defined? Rails::Railtie
        require 'rails'
        class Railtie < Rails::Railtie
          config.before_initialize do
            ActiveSupport.on_load :active_record do
              ActiveRecord::Base.send(:include, CollectiveIdea::Acts::NestedSet::Base)
            end
            
            if Object.const_defined?("ActionView")
              ActionView::Base.send(:include, CollectiveIdea::Acts::NestedSet::Helper)
            end
          end
        end
      end
    end
  end
end
