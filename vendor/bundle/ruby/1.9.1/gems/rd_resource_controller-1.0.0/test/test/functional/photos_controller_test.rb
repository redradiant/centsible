require 'test_helper'

class PhotosControllerTest < ActionController::TestCase
  def setup
    @user = users :one
    @photo = Photo.find 1
  end

  context "actions specified" do
    should "not respond to update" do
      assert !@controller.respond_to?(:update)
    end
  end

  # should_be_restful do |resource|
  #   resource.formats       = [:html]
  #
  #   resource.actions       = [:index, :new, :create, :destroy, :show, :edit]
  #   resource.create.params = {:title => 'Some Photo Title'}
  #   resource.create.flash  = "Some Photo Title was created!"
  # end

  # RESTful test
  #
  context "on GET to index" do
    setup do
      get :index, :user_id => 1
    end

    should assign_to(:photos).with_kind_of(Array)
    should assign_to(:user).with_kind_of(Account)
    should respond_with :success
    should render_with_layout
    should render_template :index
    should_not set_the_flash
  end

  context "on GET to :show" do
    setup do
      get :show, :id => 1, :user_id => 1
    end

    should assign_to(:photo).with_kind_of(Photo)
    should assign_to(:user).with_kind_of(Account)
    should respond_with(:success)
    should render_template(:show)
    should_not set_the_flash
  end

  context "on GET to :new" do
    setup do
      get :new, :user_id => 1
    end

    should assign_to(:photo).with_kind_of(Photo)
    should assign_to(:user).with_kind_of(Account)
    should respond_with :success
    should render_with_layout :photos
    should render_template :new
    should_not set_the_flash
  end

  context "on POST to :create" do
    context "that succeeds" do
      setup do
        post :create, :photo => {:title => "My photo"}, :user_id => 1
      end

      should assign_to(:photo).with_kind_of(Photo)
      should redirect_to("user photos page") { user_photo_url(@user, assigns(:photo)) }
      should set_the_flash.to "My photo was created!"

      should "create the record" do
        assert Photo.find_by_title("My photo")
      end
    end

    context "that fails" do
      setup do
        Photo.any_instance.stubs(:save).returns(false)
        post :create, :photo => {}
      end

      should assign_to(:photo).with_kind_of(Photo)
      should respond_with :success
      should render_with_layout :photos
      should render_template :new
      should_not set_the_flash
    end
  end

  context "on GET to :edit" do
    setup do
      get :edit, :id => @photo.id
    end

    should assign_to(:photo).with(@photo)
    should respond_with :success
    should render_with_layout :photos
    should render_template :edit
    should_not set_the_flash
  end

  context "on DELETE to :destroy" do
    context "that succeeds" do
      setup do
        delete :destroy, :id => @photo.id
      end

      should assign_to(:photo){ @photo }
      should redirect_to("photos index"){ photos_path }
      should set_the_flash.to "Successfully removed!"
    end

    context "that fails" do
      setup do
        Photo.any_instance.stubs(:destroy).returns(false)
        delete :destroy, :id => @photo.to_param
      end

      should respond_with(:redirect)
      should redirect_to("photo url") { photo_url @photo }
    end
  end


  # url helpers integration

  context "url, path, and hash_for helpers" do
    setup do
      get :index
    end

    should "return collection url" do
      assert_equal photos_url, @controller.send(:collection_url)
    end

    should "return collection path" do
      assert_equal photos_path, @controller.send(:collection_path)
    end

    should "return hash for collection url" do
      assert_equal hash_for_photos_url, @controller.send(:hash_for_collection_url)
    end

    should "return hash for collection path" do
      assert_equal hash_for_photos_path, @controller.send(:hash_for_collection_path)
    end

    should "return object url" do
      assert_equal photo_url(photos(:one)), @controller.send(:object_url, photos(:one))
    end

    should "return object path" do
      assert_equal photo_path(photos(:one)), @controller.send(:object_path, photos(:one))
    end

    should "return hash_for object url" do
      assert_equal hash_for_photo_url(:id => @photo.to_param), @controller.send(:hash_for_object_url, photos(:one))
    end

    should "return hash_for object path" do
      assert_equal hash_for_photo_path(:id => @photo.to_param), @controller.send(:hash_for_object_path, photos(:one))
    end

    should "return edit object url" do
      assert_equal edit_photo_url(photos(:one)), @controller.send(:edit_object_url, photos(:one))
    end

    should "return edit object path" do
      assert_equal edit_photo_path(photos(:one)), @controller.send(:edit_object_path, photos(:one))
    end

    should "return hash_for_edit object url" do
      assert_equal hash_for_edit_photo_url(:id => @photo.to_param), @controller.send(:hash_for_edit_object_url, photos(:one))
    end

    should "return hash_for_edit object path" do
      assert_equal hash_for_edit_photo_path(:id => @photo.to_param), @controller.send(:hash_for_edit_object_path, photos(:one))
    end

    should "return new object url" do
      assert_equal new_photo_url, @controller.send(:new_object_url)
    end

    should "return new object path" do
      assert_equal new_photo_path, @controller.send(:new_object_path)
    end

    should "return hash_for_new object url" do
      assert_equal hash_for_new_photo_url, @controller.send(:hash_for_new_object_url)
    end

    should "return hash_for_new object path" do
      assert_equal hash_for_new_photo_path, @controller.send(:hash_for_new_object_path)
    end
  end

end
