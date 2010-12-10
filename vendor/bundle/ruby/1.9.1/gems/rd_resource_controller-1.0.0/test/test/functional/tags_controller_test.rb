require 'test_helper'

class TagsControllerTest < ActionController::TestCase
  def setup
    @tag = Tag.find 1
  end

  context "with photo as parent" do
    context "get to :index" do
      setup do
        get :index, :photo_id => 1
      end

      should assign_to :products
      should render_template "index"
      should respond_with :success

      should "respond with html" do
        assert_equal 'text/html', @response.content_type
      end
    end

    context "xhr to :index" do
      setup do
        xhr :get, :index, :photo_id => 1
      end

      should assign_to :products
      should respond_with :success

      should "respond with rjs" do
        assert_equal 'text/javascript', @response.content_type
      end
    end

    context "post to create" do
      setup do
        post :create, :photo_id => 1, :tag => {:name => "Hello!"}
      end

      should "add tag to photo" do
        assert assigns(:photo).tags.include?(assigns(:tag)), "photo does not include new tag"
      end
    end
  end

  context "without photo as parent" do
    should "render text for a missing object" do
      get :show, :id => 50000
      assert @response.body.match(/not found/i), @response.body
    end
  end
end
