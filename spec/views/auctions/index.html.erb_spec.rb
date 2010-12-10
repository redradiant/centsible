require 'spec_helper'

describe "auctions/index.html.erb" do
  before(:each) do
    assign(:auctions, [
      stub_model(Auction),
      stub_model(Auction)
    ])
  end

  it "renders a list of auctions" do
    render
  end
end
