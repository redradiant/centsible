def add_bids_to_auction_from_user(auction, user, bi = 15)
  bids = []
  (1..bi).each do |i|
    ub = Bid.make!(:user_id => user[:id], :auction_id => auction[:id],
      :amount => i*10.00, :effective_at => (Time.now + 2.hours))
    bids << ub
  end
  bids
end
