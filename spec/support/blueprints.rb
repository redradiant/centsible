require 'machinist/active_record'
require 'sham'
require 'faker'
require 'random_data'
require 'data_generator'

# Add your blueprints here.
#
# e.g.
#   Post.blueprint do
#     title { "Post #{sn}" }
#     body  { "Lorem ipsum..." }
#   end

AmazonItem.blueprint do
  asin { 'B003O6JJKY' }
end

Auction.blueprint do
  start_time { Time.now - Random.number(1.hour..2.hours) }
  end_interval { start_time + Random.number(1.hours..3.hours) }
  #state { :upcoming }
  auction_type { 'normal' }
  bids
end

Auction.blueprint(:overtime) do
  start_time { Time.now - Random.number(3.hours..5.hours) }
  end_interval { 2.hours }
  extension_interval { 4.hours }
  #state { :open }
  auction_type { 'normal' }
  bids
end

Bid.blueprint do
  user
  auction
  effective_at { Time.now - (rand() * 60*60) }
  amount { DataGenerator::Utilities.dollar }
  engine_name { 'autobid-website' }
  engine_settings { '1.0' }
  bid_type { 'normal' }
end

UserCreditCard.blueprint do
  user
  location
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  expiration_date { Random.date(+2.years/1.day..+3.years/1.day) }
  start_date { Random.date(-2.years/1.day..-1.year/1.day) }
  verification_value { Random.number(100..999) }
  security_verified { true }
  last_attempt_successful { true }
  zip { Random.zipcode }
  phone { Faker::PhoneNumber.phone_number }
  company { Faker::Company.name }
  number { DataGenerator::MockCreditCard.test_number }
end

User.blueprint do
#  first_name { Faker::Name.first_name }
#  last_name { Faker::Name.last_name }
  email { Faker::Internet.email }
  password { DataGenerator::User.password }
  last_sign_in_ip { DataGenerator::Utilities.ip }
  #email_verified { true }
  user_locations(3)
  user_credit_cards(3)
#  active_credit_card { object.credit_cards.first }
#  shipping_address { object.user_locations.first.location }
end

UserLocation.blueprint do
  user
  location
end

Location.blueprint do
  street { Faker::Address.street_address }
  street2 { Faker::Address.secondary_address }
  city { Faker::Address.city }
  state { Faker::Address.us_state }
  country { "US" }
  postal_code { Faker::Address.zip_code }
end
