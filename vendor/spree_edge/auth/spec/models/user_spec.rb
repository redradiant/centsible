require 'spec_helper'

describe User do
  before(:all) { Role.create :name => "admin" }

  context "#create" do
    let(:user) { User.new(:email => "foo@bar.com", :password => "secret", :password_confirmation => "secret") }

    before do
      User.delete_all
      Role.delete_all
    end
    it "should have an admin role if no admin users exist yet" do
      user.save!
      user.has_role?('admin').should be_true
    end

  end
  context "anonymous!" do
    let(:user) { User.anonymous! }

    it "should create a new user" do
      user.new_record?.should be_false
    end

    it "should create a user with an example.net email" do
      user.email.should =~ /example.net/
    end
  end
end
