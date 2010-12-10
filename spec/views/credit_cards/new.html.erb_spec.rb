require 'spec_helper'

describe "credit_cards/new.html.erb" do
  before(:each) do
    assign(:credit_card, stub_model(CreditCard,
      :user_id => 1,
      :location_id => 1,
      :number => 1,
      :security_code => "MyString",
      :cardholder => "MyString",
      :company => "MyString",
      :zip => "MyString",
      :phone => "MyString"
    ).as_new_record)
  end

  it "renders new credit_card form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => credit_cards_path, :method => "post" do
      assert_select "input#credit_card_user_id", :name => "credit_card[user_id]"
      assert_select "input#credit_card_location_id", :name => "credit_card[location_id]"
      assert_select "input#credit_card_number", :name => "credit_card[number]"
      assert_select "input#credit_card_security_code", :name => "credit_card[security_code]"
      assert_select "input#credit_card_cardholder", :name => "credit_card[cardholder]"
      assert_select "input#credit_card_company", :name => "credit_card[company]"
      assert_select "input#credit_card_zip", :name => "credit_card[zip]"
      assert_select "input#credit_card_phone", :name => "credit_card[phone]"
    end
  end
end
