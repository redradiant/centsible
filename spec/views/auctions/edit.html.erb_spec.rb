require 'spec_helper'

describe "auctions/edit.html.erb" do
  before(:each) do
    @auction = assign(:auction, stub_model(Auction))
  end

  it "renders the edit auction form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => auction_path(@auction), :method => "post" do
    end
  end
end
