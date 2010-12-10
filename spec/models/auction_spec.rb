require File.expand_path('../../spec_helper.rb', __FILE__)

describe Auction do

  before(:all) do
    User.destroy_all
    @user = Factory.create(:user)
    @user.save.should be_true

    @item = Factory.create(:item)
    @item.save.should be_true

    @auction = Factory.build(:auction, :item_id => @item[:id])
    @auction.save.should be_true

    @bids = []
    (1..15).each do |i|
      ub = Bid.create(:user_id => @user[:id], :auction_id => @auction[:id],
        :amount => i*10.00, :effective_at => (Time.now + 2.hours))
      @bids << ub
    end
  end

  it "should have 15 bids" do
    @auction.reload
    @auction.bids.should have(15).items
    @auction.bids.first.amount.should eql 10.00
  end

  it "should have time remaining" do
    @auction.end_time.should eql (@auction.start_time + 4.hours).getutc
    @auction.should be_running
    @auction.should_not be_ended
    @auction.should be_started
    @auction.remaining_time_words.should match(/(minutes? and \d+ seconds?|hours? and \d+ minutes?)/)
  end

  it "should allow bidding" do
    t = Time.now.getutc
    b = @auction.bids.create(:user_id => @user[:id], :effective_at => t)
    b.should be_a_kind_of(Bid)
    b.auction_id.should eql @auction[:id]
    b.effective_at.should eql t
    b.effective_at.reload.zone.should eql "UTC"
    b.effective_at.in_time_zone($cst).utc_offset.should eql -6.hours.to_i
  end


  it "can't bid on a closed auction" do
    @closed = Factory.create(:auction, :item_id => @item[:id], :start_time => (Time.now - 20.hours), :end_interval => 4.hours)  
    @closed.should be_started
    @closed.should be_ended
    @closed.should_not be_running
    expect {@user.bid_on!(@closed)}.to_not change{@user.bids.count}.from(0).to(1)
    @user.bid_on!(@closed).should be_blank
  end

  it "bids on an active auction" do
    @running = Factory.create(:auction, :item_id => @item[:id], :start_time => (Time.now - 2.hours), :end_interval => 4.hours) 
    @running.seconds_remaining.should be_within(5.minutes).of(2.hours) 
    @running.should be_started
    @running.should_not be_ended
    @running.should be_running
    bidcount = Bid.count(:conditions => ['auction_id = ?', @running.id] )
    bidcount.should eql 0
    expect {@user.bid_on!(@running)}.to change{@running.bids.count}.by(1)
    (b = @user.bids.last)[:auction_id].to_s.should eql @running.id.to_s
    @running.bids.reload.should have(bidcount + 1).items
  end

  it "extends the time when an auction is in overtime" do
  end

#Factory.create(:overtime_auction)

  it "should be in upcoming state before starting" do
  end

  it "should start" do
  end

  it "should extend the end time by 10 seconds when bids are placed in overtime" do

  end

end
