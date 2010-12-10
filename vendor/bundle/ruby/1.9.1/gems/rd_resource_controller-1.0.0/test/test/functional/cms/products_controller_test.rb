require 'test_helper'

class Cms::ProductsControllerTest < ActionController::TestCase
  def setup
    @product = products :one
  end

  context "on POST to :create" do
    context "that succeeds" do
      setup do
        post :create, :product => {:name => "My Product"}
      end

      should assign_to(:product).with_kind_of(Product)
      should redirect_to("products page") { cms_product_url(assigns(:product)) }
      should set_the_flash.to "something"

      should "create the record" do
        assert Product.find_by_name("My Product")
      end
    end

    context "that fails" do
      setup do
        Product.any_instance.stubs(:save).returns(false)
        post :create, :product => {}
      end

      should assign_to(:product).with_kind_of(Product)
      should respond_with :success
      should render_with_layout :application
      should render_template :new
      should_not set_the_flash
    end
  end

end
