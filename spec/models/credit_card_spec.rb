require File.expand_path('../../spec_helper.rb', __FILE__)

describe CreditCard do

  before(:all) do
    User.destroy_all

    @user = Factory.create(:user)
    @location = Factory.create(:location)
    @valid = Factory.create(:valid_card, :zip => @location.postal_code)
  end

  it "should have a valid type" do
    @valid.type.should match(/(visa|master|discover|american_express)/)
  end

  it "should allow setting a location" do
    @valid.update_attribute(:location, @location).should be_true
    @valud.should be_valid
  end

  it "should save the location and recall it" do
    @valid.location.reload
    @valid.location.city.should eql @location.city
  end


end
