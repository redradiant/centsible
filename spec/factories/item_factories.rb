require_dependency 'amazon_item'
require_dependency 'auction'
require_dependency 'bid'

Factory.define :item, :class => AmazonItem do |f|
  f.asin 'B003O6JJKY'
end

Factory.define :auction, :class => Auction do |f|
  start = Time.now - Random.number(1.hour..2.hours)
  f.start_time start
  f.end_interval (start + Random.number(1.hours..3.hours) )
  f.state :upcoming
  f.auction_type 'normal'
end

Factory.define :overtime_auction, :class => Auction do |f|
  f.start_time Time.now - Random.number(3.hours..5.hours)
  f.end_interval 2.hours
  f.extension_interval 4.hours
  f.state :open
  f.auction_type 'normal'
end

Factory.define :bid, :class => Bid do |f|
  f.association :user, :factory => :user, :last_name => "Stubley"
  f.effective_at Time.now - (rand() * 60*60)
  f.amount DataGenerator::Utilities.dollar
  f.engine_name 'autobid-website'
  f.engine_settings '1.0'
  f.bid_type 'normal'
end
