@user = User.make
@loc = @user.user_locations.first.location
#@user.shipping_location = @loc
#@user.save!
@newloc = Location.make!

Given /^I have an outdated address$/ do
  @user.shipping_location.should eql @loc
  @user.user_locations.should have(1).items
end

When /^I add a new location$/ do
  @user.user_locations.create(:location => @newloc)
  @user.user_locations.reload
end

Then /^it should be stored with my account$/ do
  @user.locations.should include(@newloc)
end

Then /^it should become my main shipping location$/ do
  @user.shipping_location = @newloc
  @user.save.should be_true
end

Then /^it should be a valid address$/ do
  true #TODO
end

Then /^it should be geolocatable$/ do
  true #TODO
end

Then /^it should have some connection to my billing address$/ do
  true #TODO
end

Then /^my old address should not be deleted but marked inactive$/ do
  @user.user_locations.should have(2).items
  @user.locations.should include(@loc, @newloc)
end
