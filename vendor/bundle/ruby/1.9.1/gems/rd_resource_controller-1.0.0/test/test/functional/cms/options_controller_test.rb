require 'test_helper'

class Cms::OptionsControllerTest < ActionController::TestCase
  def setup
    @product = products :one
    @option = options :one
  end

  context "on GET to index" do
    setup do
      get :index, :product_id => 1
    end

    should assign_to(:options).with_kind_of(Array)
    should assign_to(:product).with_kind_of(Product)
    should respond_with :success
    should render_with_layout
    should render_template :index
    should_not set_the_flash
  end

  context "on GET to :show" do
    setup do
      get :show, :id => 1, :product_id => 1
    end

    should assign_to(:option).with_kind_of(Option)
    should assign_to(:product).with_kind_of(Product)
    should respond_with(:success)
    should render_template(:show)
    should_not set_the_flash
  end

  context "on GET to :new" do
    setup do
      get :new, :product_id => 1
    end

    should assign_to(:option).with_kind_of(Option)
    should assign_to(:product).with_kind_of(Product)
    should respond_with :success
    should render_with_layout :application
    should render_template :new
    should_not set_the_flash
  end

  context "on POST to :create" do
    context "that succeeds" do
      setup do
        post :create, :product_id => @product.id, :option => {:title => "My option"}, :product_id => 1
      end

      should assign_to(:option).with_kind_of(Option)
      should redirect_to("product options index") { cms_product_option_url(@product, assigns(:option)) }
      should set_the_flash.to "Successfully created!"

      should "create the record" do
        assert Option.find_by_title("My option")
      end
    end

    context "that fails" do
      setup do
        Option.any_instance.stubs(:save).returns(false)
        post :create, :product_id => @product.id, :option => {}
      end

      should assign_to(:option).with_kind_of(Option)
      should respond_with :success
      should render_with_layout :application
      should render_template :new
      should_not set_the_flash
    end
  end

  context "on GET to :edit" do
    setup do
      get :edit, :product_id => @product.id, :id => @option.id
    end

    should assign_to(:option).with(@option)
    should respond_with :success
    should render_with_layout :application
    should render_template :edit
    should_not set_the_flash
  end

  context "on PUT to :update" do
    context "that succeeds" do
      setup do
        put :update, :product_id => @product.id, :id => @option.id, :option => {:title => 'My new option'}
      end

      should assign_to(:option){ @option }
      should redirect_to("option page") { cms_product_option_path(assigns(:option)) }
      should set_the_flash.to "Successfully updated!"

      should "update the record" do
        @option.reload
        assert_equal 'My new option', @option.title
      end
    end

    context "that fails" do
      setup do
        Option.any_instance.stubs(:update_attributes).returns(false)
        put :update, :product_id => @product.id, :id => @option.id, :option => {:title => 'My new option'}
      end

      should assign_to(:object).with_kind_of(Option)
      should assign_to(:option).with_kind_of(Option)
      should respond_with :success
      should render_with_layout :application
      should render_template :edit
      should_not set_the_flash
    end
  end

  context "on DELETE to :destroy" do
    context "that succeeds" do
      setup do
        delete :destroy, :product_id => @product.id, :id => @option.id
      end

      should assign_to(:option){ @option }
      should redirect_to("options index"){ cms_product_options_url }
      should set_the_flash.to "Successfully removed!"
    end

    context "that fails" do
      setup do
        Option.any_instance.stubs(:destroy).returns(false)
        delete :destroy, :product_id => @product.id, :id => @option.to_param
      end

      should respond_with(:redirect)
      should redirect_to("option url") { cms_product_option_url @option }
    end
  end
end
