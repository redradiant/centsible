require "spec_helper"

describe CreditCardsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/credit_cards" }.should route_to(:controller => "credit_cards", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/credit_cards/new" }.should route_to(:controller => "credit_cards", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/credit_cards/1" }.should route_to(:controller => "credit_cards", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/credit_cards/1/edit" }.should route_to(:controller => "credit_cards", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/credit_cards" }.should route_to(:controller => "credit_cards", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/credit_cards/1" }.should route_to(:controller => "credit_cards", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/credit_cards/1" }.should route_to(:controller => "credit_cards", :action => "destroy", :id => "1")
    end

  end
end
