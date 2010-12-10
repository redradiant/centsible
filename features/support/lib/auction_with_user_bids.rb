class AuctionWithUserBids
  attr_accessor :user, :item, :auction, :bids

  def initialize(&block)
    @user = User.make
    @item = Item.make
    @auction = Auction.make
    
    # Setup some bids
    @bids = []
    (1..15).each do |i|
      ub = Bid.make(:user_id => @user[:id], :auction_id => @auction[:id],
        :amount => i*10.00, :effective_at => (Time.now + 2.hours))
      @bids << ub
    end
    yield(self) if block_given?
  end
end
