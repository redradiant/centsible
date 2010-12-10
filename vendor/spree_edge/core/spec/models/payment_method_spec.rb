require 'spec_helper'

class Gateway::Test < Gateway
end

describe PaymentMethod do
  describe "self#register" do
    it "should increase all#size by 1" do
      expect {
        Gateway::Test.register
      }.to change{PaymentMethod.providers.size}.by(1)
    end
  end

  describe "#available" do
    before(:all) do
      [nil, 'both', 'front_end', 'back_end'].each do |display_on|
        Fabricate(:payment_method, :type => 'Gateway::Test', :name => 'Display Both', :display_on => display_on)
      end
      PaymentMethod.all.size.should == 4
    end

    it "should return all methods available to front-end/back-end when no parameter is passed" do
      PaymentMethod.available.size.should == 2
    end

    it "should return all methods available to front-end/back-end when display_on = :both" do
      PaymentMethod.available(:both).size.should == 2
    end

    it "should return all methods available to front-end when display_on = :front_end" do
      PaymentMethod.available(:front_end).size.should == 2
    end

    it "should return all methods available to back-end when display_on = :back_end" do
      PaymentMethod.available(:back_end).size.should == 2
    end

    after(:all) do
      PaymentMethod.delete_all
    end
  end

end
