class AmazonItem < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper

  has_many :pictures, :as => :target

  validate 'asin', :uniqueness => true

  before_save :populate_title
  after_save :populate_title

  def self.load(asin = nil)
    AmazonItem.find_or_create_by_asin(asin.to_s) rescue nil
  end

  def populate_title
    (self.name = self.key(:title) unless self.name.present?) rescue nil
  end

  module ObjectHelpers
    def asin_load(*args)
      ::AmazonItem.load(*args)
    end
  end

  def data(force = false)
    @asin = nil if force
    return nil if (self.asin.blank? rescue true)
    @asin = ASIN.lookup(self.asin.to_s)
    @asin.raw.ItemLookupResponse.Items.Item rescue @asin.raw
  end


  def image_sets
    @i ||= Hash.new
    return(@i) unless @i.blank? 
    hgroup = self.data.ImageSets.first.last.map { |e| e.to_a }.collect do |set|
      type = set.first.last
      set.shift
      hash = set
      @i[type.to_sym] ||= Array.new
      @i[type.to_sym] << Hash[hash.map { |e2| [e2.first.to_s.underscore.to_sym, e2.last] }]
    end
    @i
  end

  def image_categories
    image_sets.first[1..-1].first.map { |t| t[:category] }
  end

  def image_type_urls(kind = :large)
    ikey = "#{kind.to_s.underscore}_image".to_sym
    image_sets.values.flatten.collect { |is| is[ikey] }.map { |im| im["URL"] }
  end

  def key(keyn)
    self.to_hash[keyn.to_s.underscore] rescue nil
  end

  def amount_raw
    (self.key(:list_price)[:amount].to_f / 100.00) rescue self.key(:list_price)[:amount].to_f
  end
  alias :amount :amount_raw

  def amount_string
    number_with_precision(amount_raw, :precision => 2 )
  end

  def to_hash
    @nh = self.data.ItemAttributes.underscore_keys.stringify_keys
  end

end


Object.send(:include, AmazonItem::ObjectHelpers)
