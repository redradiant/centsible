Factory.define :valid_card, :class => CreditCard do |f|
  f.first_name Faker::Name.first_name
  f.last_name Faker::Name.last_name
  f.expiration_date Random.date(+2.years/1.day..+3.years/1.day)
  f.start_date Random.date(-2.years/1.day..-1.year/1.day)
  f.verification_value Random.number(100..999)
  f.security_verified true
  f.last_attempt_successful true
  f.zip Random.zipcode
  f.phone Faker::PhoneNumber.phone_number
  f.company Faker::Company.name
  f.number DataGenerator::MockCreditCard.test_number
end

