require 'test_helper'

class PeopleControllerTest < ActionController::TestCase
  def setup
    @person = accounts :one
  end

  # should_be_restful do |resource|
  #   resource.formats = [:html]
  #   resource.klass   = Account
  #   resource.object  = :person
  #
  #   resource.create.redirect = 'person_url(@person)'
  #   resource.update.redirect = 'person_url(@person)'
  #   resource.destroy.redirect = 'people_url'
  # end

  context "on GET to index" do
    setup do
      get :index
    end

    should assign_to(:people).with_kind_of(Array)
    should respond_with :success
    should render_with_layout
    should render_template :index
    should_not set_the_flash
  end

  context "on GET to :show" do
    setup do
      get :show, :id => 1
    end

    should assign_to(:person)
    should respond_with(:success)
    should render_template(:show)
    should_not set_the_flash
  end

  context "on GET to :new" do
    setup do
      get :new
    end

    should assign_to(:person).with_kind_of(Account)
    should respond_with :success
    should render_with_layout :people
    should render_template :new
    should_not set_the_flash
  end

  context "on POST to :create" do
    context "that succeeds" do
      setup do
        post :create, :person => {}
      end

      should assign_to(:person).with_kind_of(Account)
      should redirect_to("people index") { person_url(assigns(:person)) }
      should set_the_flash.to "Successfully created!"

      should "create the record" do
        assert Account.find_by_name("Bob Loblaw")
      end
    end

    context "that fails" do
      setup do
        Account.any_instance.stubs(:save).returns(false)
        post :create, :person => {}
      end

      should assign_to(:person).with_kind_of(Account)
      should respond_with :success
      should render_with_layout :people
      should render_template :new
      should_not set_the_flash
    end
  end

  context "on GET to :edit" do
    setup do
      get :edit, :id => @person.id
    end

    should assign_to(:person).with(@person)
    should respond_with :success
    should render_with_layout :people
    should render_template :edit
    should_not set_the_flash
  end

  context "on PUT to :update" do
    context "that succeeds" do
      setup do
        put :update, :id => @person.id, :person => {:name => 'Marcel Marceau'}
      end

      should assign_to(:person){ @person }
      should redirect_to("person page") { person_path(assigns(:person)) }
      should set_the_flash.to "Successfully updated!"

      should "update the record" do
        @person.reload
        assert_equal 'Marcel Marceau', @person.name
      end
    end

    context "that fails" do
      setup do
        Account.any_instance.stubs(:update_attributes).returns(false)
        put :update, :id => @person.id, :person => {:name => 'Marcel Marceau'}
      end

      should assign_to(:object).with_kind_of(Account)
      should assign_to(:person).with_kind_of(Account)
      should respond_with :success
      should render_with_layout :people
      should render_template :edit
      should_not set_the_flash
    end
  end

  context "on DELETE to :destroy" do
    context "that succeeds" do
      setup do
        delete :destroy, :id => @person.id
      end

      should assign_to(:person){ @person }
      should redirect_to("people index"){ people_path }
      should set_the_flash.to "Successfully removed!"
    end

    context "that fails" do
      setup do
        Account.any_instance.stubs(:destroy).returns(false)
        delete :destroy, :id => @person.to_param
      end

      should respond_with(:redirect)
      should redirect_to("person url") { person_url @person }
    end
  end

end
