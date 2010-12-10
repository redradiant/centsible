require 'spec_helper'

describe "credit_cards/show.html.erb" do
  before(:each) do
    @credit_card = assign(:credit_card, stub_model(CreditCard,
      :user_id => 1,
      :location_id => 1,
      :number => 1,
      :security_code => "Security Code",
      :cardholder => "Cardholder",
      :company => "Company",
      :zip => "Zip",
      :phone => "Phone"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Security Code/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Cardholder/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Company/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Zip/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Phone/)
  end
end
