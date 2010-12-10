require 'rubygems'
raise 'Arspy only runs in an ActiveRecord environment' unless defined?(ActiveRecord::Base)
$:.unshift(File.dirname(__FILE__)) unless $:.include?(File.dirname(__FILE__))

require 'active_support/core_ext/string/inflections'
require 'meta_programming'
require 'arspy/operators'
require 'arspy/delegators'
require 'arspy/class_extensions'
gem 'awesome_print', ">= 0.1.1"
require 'ap'

module Arspy
  def self.included(base)
    base.send :include, Delegators::Factory.module_for(base)
    extension = "Arspy::ClassExtensions::#{base.name}".constantize rescue nil
    base.extend(extension) if extension
  end
end

a = ActiveRecord::Associations
returning([Array, ActiveRecord::Base, a::AssociationCollection ]) { |classes|
  unless a::HasManyThroughAssociation.superclass == a::HasManyAssociation
    classes << a::HasManyThroughAssociation    
  end
}.each do |klass|
  klass.send :include, Arspy
end

