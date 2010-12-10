require 'spec_helper'

describe "auctions/new.html.erb" do
  before(:each) do
    assign(:auction, stub_model(Auction).as_new_record)
  end

  it "renders new auction form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => auctions_path, :method => "post" do
    end
  end
end
