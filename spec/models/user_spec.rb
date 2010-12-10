require File.expand_path('../../spec_helper.rb', __FILE__)

describe User do

  before(:all) do
    User.destroy_all
    @user = Factory.create(:user)

    @locations = []
    Location.destroy_all

    @user.locations.destroy_all
    @user.locations.reload
    (1..5).each do |i|
      l = Factory.create(:location)
      @locations << l
      @user.locations.create(:user => @user, :location => l)
    end
  end

  it "saves user" do
    @user.save.should be_true
    @user.should be_valid
  end

  it "has 4 locations" do
    @user.locations.should have_at_least(4).items
  end

end
