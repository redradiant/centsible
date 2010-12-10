Bid.blueprint do
  user
  effective_at { Time.now - (rand() * 60*60) }
  amount { DataGenerator::Utilities.dollar }
  engine_name { 'autobid-website' }
  engine_settings { '1.0' }
  bid_type { 'normal' }
end
