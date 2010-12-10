@me, @user2 = User.make!(2)
@item = AmazonItem.make!
@auction = Auction.make!(:overtime)
#@bids = Cucumber::Helpers::Auction.add_bids_to_auction_from_user(@auction, @user2)

Given /^I am not the highest bidder$/ do
  @auction.current_winning_user.should eql @user2
end

Given /^the auction is in overtime$/ do
  @auction.should be_running
  @auction.should be_overtime
end

Given /^I have bids available$/ do
  true  #TODO
end

When /^I place a bid$/ do
  b = @me.bid_on!(@auction)
  @auction.reload.should be_true
  b.should be_a_kind_of(Bid)
  b.auction_id.should eql @auction[:id]
end

Then /^I should become the highest bidder$/ do
  @auction.current_winning_user.should eql @me
end

Then /^it should have (\d+) bids$/ do |arg1|
  expect {@me.bid_on!(@auction)}.to change{@auction.bids.count}.by(1)
end

Then /^it should have (\d+) more seconds remaining$/ do |arg1|
  @auction.seconds_remaining.should be_within(5.seconds).of(Time.now.to_i + 10.seconds)
end

Then /^I should not be able to bid over myself$/ do
  expect { @me.bid_on!(@auction) }.to raise_error(BidError)
end

Then /^it should allow more bidding$/ do
  expect {
    @user2.bid_on!(@auction)
    @me.bid_on!(@auction)
    }.to change{@auction.bids.count}.by(2)
end

Then /^I should win if nobody else bids$/ do
  expect { @auction.end! }.to change{@auction.state}.to(:closed)
end
