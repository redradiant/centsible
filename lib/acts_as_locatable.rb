require 'active_support/concern'
require 'geokit'

module ActsAsLocatable
  extend ActiveSupport::Concern

  module ClassMethods
    def has_location(attr = :location)
      attr = attr.to_sym
      has_one attr, :as => :locatable, :class_name => "Location", :foreign_key => "#{attr.to_s}_id"
      acts_as_mappable :through => attr
    end
  end
end

ActiveRecord::Base.class_eval { include ActsAsLocatable }
