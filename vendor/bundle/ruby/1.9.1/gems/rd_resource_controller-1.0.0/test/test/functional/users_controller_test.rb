require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    @dude = accounts :one
  end

  context "on GET to index" do
    setup do
      get :index
    end

    should assign_to(:dudes).with_kind_of(Array)
    should respond_with :success
    should render_with_layout
    should render_template :index
    should_not set_the_flash
  end

  context "on GET to :show" do
    setup do
      get :show, :id => 1
    end

    should assign_to(:dude)
    should respond_with(:success)
    should render_template(:show)
    should_not set_the_flash
  end

  context "on GET to :new" do
    setup do
      get :new
    end

    should assign_to(:dude).with_kind_of(Account)
    should respond_with :success
    should render_with_layout :application
    should render_template :new
    should_not set_the_flash
  end

  context "on POST to :create" do
    context "that succeeds" do
      setup do
        post :create, :dude => {:name => "My User"}
      end

      should assign_to(:dude).with_kind_of(Account)
      should redirect_to("dude page") { dude_url(assigns(:dude)) }
      should set_the_flash.to "Successfully created!"

      should "create the record" do
        assert Account.find_by_name("My User")
      end
    end

    context "that fails" do
      setup do
        Account.any_instance.stubs(:save).returns(false)
        post :create, :account => {}
      end

      should assign_to(:dude).with_kind_of(Account)
      should respond_with :success
      should render_with_layout :application
      should render_template :new
      should_not set_the_flash
    end
  end

  context "on GET to :edit" do
    setup do
      get :edit, :id => @dude.id
    end

    should assign_to(:dude).with(@dude)
    should respond_with :success
    should render_with_layout :application
    should render_template :edit
    should_not set_the_flash
  end

  context "on PUT to :update" do
    context "that succeeds" do
      setup do
        put :update, :id => @dude.id, :dude => {:name => 'My new user'}
      end

      should assign_to(:dude){ @dude }
      should redirect_to("dude page") { dude_path(assigns(:dude)) }
      should set_the_flash.to "Successfully updated!"

      should "update the record" do
        @dude.reload
        assert_equal 'My new user', @dude.name
      end
    end

    context "that fails" do
      setup do
        Account.any_instance.stubs(:update_attributes).returns(false)
        put :update, :id => @dude.id, :user => {:name => 'My new user'}
      end

      should assign_to(:object).with_kind_of(Account)
      should assign_to(:dude).with_kind_of(Account)
      should respond_with :success
      should render_with_layout :application
      should render_template :edit
      should_not set_the_flash
    end
  end

  context "on DELETE to :destroy" do
    context "that succeeds" do
      setup do
        delete :destroy, :id => @dude.id
      end

      should assign_to(:dude){ @dude }
      should redirect_to("dudes index"){ dudes_url }
      should set_the_flash.to "Successfully removed!"
    end

    context "that fails" do
      setup do
        Account.any_instance.stubs(:destroy).returns(false)
        delete :destroy, :id => @dude.to_param
      end

      should respond_with(:redirect)
      should redirect_to("dude url") { dude_url assigns(:dude) }
    end
  end

end