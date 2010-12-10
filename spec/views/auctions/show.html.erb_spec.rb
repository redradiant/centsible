require 'spec_helper'

describe "auctions/show.html.erb" do
  before(:each) do
    @auction = assign(:auction, stub_model(Auction))
  end

  it "renders attributes in <p>" do
    render
  end
end
