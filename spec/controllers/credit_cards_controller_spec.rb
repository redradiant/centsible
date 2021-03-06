require 'spec_helper'

describe CreditCardsController do

  def mock_credit_card(stubs={})
    (@mock_credit_card ||= mock_model(CreditCard).as_null_object).tap do |credit_card|
      credit_card.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all credit_cards as @credit_cards" do
      CreditCard.stub(:all) { [mock_credit_card] }
      get :index
      assigns(:credit_cards).should eq([mock_credit_card])
    end
  end

  describe "GET show" do
    it "assigns the requested credit_card as @credit_card" do
      CreditCard.stub(:find).with("37") { mock_credit_card }
      get :show, :id => "37"
      assigns(:credit_card).should be(mock_credit_card)
    end
  end

  describe "GET new" do
    it "assigns a new credit_card as @credit_card" do
      CreditCard.stub(:new) { mock_credit_card }
      get :new
      assigns(:credit_card).should be(mock_credit_card)
    end
  end

  describe "GET edit" do
    it "assigns the requested credit_card as @credit_card" do
      CreditCard.stub(:find).with("37") { mock_credit_card }
      get :edit, :id => "37"
      assigns(:credit_card).should be(mock_credit_card)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created credit_card as @credit_card" do
        CreditCard.stub(:new).with({'these' => 'params'}) { mock_credit_card(:save => true) }
        post :create, :credit_card => {'these' => 'params'}
        assigns(:credit_card).should be(mock_credit_card)
      end

      it "redirects to the created credit_card" do
        CreditCard.stub(:new) { mock_credit_card(:save => true) }
        post :create, :credit_card => {}
        response.should redirect_to(credit_card_url(mock_credit_card))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved credit_card as @credit_card" do
        CreditCard.stub(:new).with({'these' => 'params'}) { mock_credit_card(:save => false) }
        post :create, :credit_card => {'these' => 'params'}
        assigns(:credit_card).should be(mock_credit_card)
      end

      it "re-renders the 'new' template" do
        CreditCard.stub(:new) { mock_credit_card(:save => false) }
        post :create, :credit_card => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested credit_card" do
        CreditCard.should_receive(:find).with("37") { mock_credit_card }
        mock_credit_card.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :credit_card => {'these' => 'params'}
      end

      it "assigns the requested credit_card as @credit_card" do
        CreditCard.stub(:find) { mock_credit_card(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:credit_card).should be(mock_credit_card)
      end

      it "redirects to the credit_card" do
        CreditCard.stub(:find) { mock_credit_card(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(credit_card_url(mock_credit_card))
      end
    end

    describe "with invalid params" do
      it "assigns the credit_card as @credit_card" do
        CreditCard.stub(:find) { mock_credit_card(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:credit_card).should be(mock_credit_card)
      end

      it "re-renders the 'edit' template" do
        CreditCard.stub(:find) { mock_credit_card(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested credit_card" do
      CreditCard.should_receive(:find).with("37") { mock_credit_card }
      mock_credit_card.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the credit_cards list" do
      CreditCard.stub(:find) { mock_credit_card }
      delete :destroy, :id => "1"
      response.should redirect_to(credit_cards_url)
    end
  end

end
