require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  def setup
    @project = projects :one
  end

  context "on GET to index" do
    setup do
      get :index
    end

    should assign_to(:projects).with_kind_of(Array)
    should respond_with :success
    should render_with_layout
    should render_template :index
    should_not set_the_flash
  end

  context "on GET to :show" do
    setup do
      get :show, :id => 1
    end

    should assign_to(:project)
    should respond_with(:success)
    should render_template(:show)
    should_not set_the_flash
  end

  context "on GET to :new" do
    setup do
      get :new
    end

    should assign_to(:project).with_kind_of(Project)
    should respond_with :success
    should render_with_layout :projects
    should render_template :new
    should_not set_the_flash
  end

  context "on POST to :create" do
    context "that succeeds" do
      setup do
        post :create, :project => {:title => "My Project"}
      end

      should assign_to(:project).with_kind_of(Project)
      should redirect_to("projects page") { project_url(assigns(:project)) }
      should set_the_flash.to "Successfully created!"

      should "create the record" do
        assert Project.find_by_title("My Project")
      end
    end

    context "that fails" do
      setup do
        Project.any_instance.stubs(:save).returns(false)
        post :create, :project => {}
      end

      should assign_to(:project).with_kind_of(Project)
      should respond_with :success
      should render_with_layout :projects
      should render_template :new
      should_not set_the_flash
    end
  end

  context "on GET to :edit" do
    setup do
      get :edit, :id => @project.id
    end

    should assign_to(:project).with(@project)
    should respond_with :success
    should render_with_layout :projects
    should render_template :edit
    should_not set_the_flash
  end

  context "on PUT to :update" do
    context "that succeeds" do
      setup do
        put :update, :id => @project.id, :project => {:title => 'My new project'}
      end

      should assign_to(:project){ @project }
      should redirect_to("project page") { project_path(assigns(:project)) }
      should set_the_flash.to "Successfully updated!"

      should "update the record" do
        @project.reload
        assert_equal 'My new project', @project.title
      end
    end

    context "that fails" do
      setup do
        Project.any_instance.stubs(:update_attributes).returns(false)
        put :update, :id => @project.id, :project => {:title => 'My new project'}
      end

      should assign_to(:object).with_kind_of(Project)
      should assign_to(:project).with_kind_of(Project)
      should respond_with :success
      should render_with_layout :projects
      should render_template :edit
      should_not set_the_flash
    end
  end

  context "on DELETE to :destroy" do
    context "that succeeds" do
      setup do
        delete :destroy, :id => @project.id
      end

      should assign_to(:project){ @project }
      should redirect_to("projects index"){ projects_path }
      should set_the_flash.to "Successfully removed!"
    end

    context "that fails" do
      setup do
        Project.any_instance.stubs(:destroy).returns(false)
        delete :destroy, :id => @project.to_param
      end

      should respond_with(:redirect)
      should redirect_to("project url") { project_url @project }
    end
  end

end
