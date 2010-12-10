require 'test_helper'

class Cms::PhotosControllerTest < ActionController::TestCase
  def setup
    @person = personnel :one
    @photo = photos :one
  end

  context "with personnel as parent" do
    context "on get to :index" do
      setup do
        get :index, :personnel_id => 1
      end

      should respond_with :success
      should render_template "index"
      should assign_to :photos
      should assign_to :personnel
      should "scope photos to personnel" do
        assert assigns(:photos).all? { |photo| photo.personnel.id == 1 }
      end
    end

    context "on post to :create" do
      setup do
        post :create, :personnel_id => 1, :photo => {}
      end

      should redirect_to('cms_personnel_photo_path') { cms_personnel_photo_path(@person, assigns(:photo)) }
      should assign_to :photo
      should assign_to :personnel
      should "scope photo to personel" do
        assert personnel(:one), assigns(:photo).personnel
      end
    end
  end
end
