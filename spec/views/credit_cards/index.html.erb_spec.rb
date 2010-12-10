require 'spec_helper'

describe "credit_cards/index.html.erb" do
  before(:each) do
    assign(:credit_cards, [
      stub_model(CreditCard,
        :user_id => 1,
        :location_id => 1,
        :number => 1,
        :security_code => "Security Code",
        :cardholder => "Cardholder",
        :company => "Company",
        :zip => "Zip",
        :phone => "Phone"
      ),
      stub_model(CreditCard,
        :user_id => 1,
        :location_id => 1,
        :number => 1,
        :security_code => "Security Code",
        :cardholder => "Cardholder",
        :company => "Company",
        :zip => "Zip",
        :phone => "Phone"
      )
    ])
  end

  it "renders a list of credit_cards" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Security Code".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Cardholder".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Company".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Zip".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
  end
end
