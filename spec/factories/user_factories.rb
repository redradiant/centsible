Factory.define :user, :class => User do |f|
  f.first_name Faker::Name.first_name
  f.last_name Faker::Name.last_name
  f.email Faker::Internet.email
  f.password DataGenerator::User.password
  f.last_sign_in_ip DataGenerator::Utilities.ip
  f.email_verified true
end

Factory.define :location, :class => 'Location' do |f|
  f.street Faker::Address.street_address
  f.street2 Faker::Address.secondary_address
  f.city Faker::Address.city
  f.state Faker::Address.us_state
  f.country "US"
  f.postal_code Faker::Address.zip_code
end

