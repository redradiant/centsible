require "spec_helper"

describe AuctionsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/auctions" }.should route_to(:controller => "auctions", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/auctions/new" }.should route_to(:controller => "auctions", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/auctions/1" }.should route_to(:controller => "auctions", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/auctions/1/edit" }.should route_to(:controller => "auctions", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/auctions" }.should route_to(:controller => "auctions", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/auctions/1" }.should route_to(:controller => "auctions", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/auctions/1" }.should route_to(:controller => "auctions", :action => "destroy", :id => "1")
    end

  end
end
