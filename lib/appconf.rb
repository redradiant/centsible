require 'yaml'
require 'erb'
require 'active_support/ordered_hash'
require 'hashie/mash'
require 'singleton'

class Appconf
  include Singleton

  attr_writer :hash

  @@conf = nil
  @@raw = {}

  def self.loadme!(file = nil)
    @@conf = file unless file.blank?
    @@conf ||= File.expand_path('config/config.yml', Rails.root)
    @@raw = YAML.load(ERB.new(File.read(@@conf)).result)[Rails.env] rescue {}
#    instance.hash = ActiveSupport::OrderedHash.new.deep_merge(@@raw)
    instance.hash = Hashie::Mash.new.deep_merge(@@raw.to_hash)
  end

  def self.method_missing(*args, &block)
    self.instance.send(*args, &block)
  end

  def hash
    self.class.loadme! unless !@hash.blank?
    @hash
  end

  def method_missing(*args, &block)
    hash.send(*args, &block)
  end
  
end

Appconf.loadme!
