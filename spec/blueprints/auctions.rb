Auction.blueprint do
  start_time { Time.now - Random.number(1.hour..2.hours) }
  end_interval { start_time + Random.number(1.hours..3.hours) }
  state { :upcoming }
  auction_type { 'normal' }
end

Auction.blueprint(:overtime) do
  start_time { Time.now - Random.number(3.hours..5.hours) }
  end_interval { 2.hours }
  extension_interval { 4.hours }
  state { :open }
  auction_type { 'normal' }
end

