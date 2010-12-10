require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  def setup
    @post = posts :one
    @comment = Comment.find 1
  end

  context "on GET to index" do
    setup do
      get :index, :post_id => 1
    end

    should assign_to(:comments).with_kind_of(Array)
    should assign_to(:post).with_kind_of(Post)
    should respond_with :success
    should render_with_layout
    should render_template :index
    should_not set_the_flash
  end

  context "on GET to :show" do
    setup do
      get :show, :id => 1, :post_id => 1
    end

    should assign_to(:comment).with_kind_of(Comment)
    should assign_to(:post).with_kind_of(Post)
    should respond_with(:success)
    should render_template(:show)
    should_not set_the_flash
  end

  context "on GET to :new" do
    setup do
      get :new, :post_id => 1
    end

    should assign_to(:comment).with_kind_of(Comment)
    should assign_to(:post).with_kind_of(Post)
    should respond_with :success
    should render_with_layout :comments
    should render_template :new
    should_not set_the_flash
  end

  context "on POST to :create" do
    context "that succeeds" do
      setup do
        post :create, :comment => {:body => "My comment", :author => "Somebody"}, :post_id => 1
      end

      should assign_to(:comment).with_kind_of(Comment)
      should redirect_to("post comments index") { post_comment_url(@post, assigns(:comment)) }
      should set_the_flash.to "Successfully created!"

      should "create the record" do
        assert Comment.find_by_body("My comment")
      end
    end

    context "that fails" do
      setup do
        Comment.any_instance.stubs(:save).returns(false)
        post :create, :comment => {}
      end

      should assign_to(:comment).with_kind_of(Comment)
      should respond_with :success
      should render_with_layout :comments
      should render_template :new
      should_not set_the_flash
    end
  end

  context "on GET to :edit" do
    setup do
      get :edit, :id => @comment.id
    end

    should assign_to(:comment).with(@comment)
    should respond_with :success
    should render_with_layout :comments
    should render_template :edit
    should_not set_the_flash
  end

  context "on PUT to :update" do
    context "that succeeds" do
      setup do
        put :update, :id => @comment.id, :comment => {:body => 'My new comment'}
      end

      should assign_to(:comment){ @comment }
      should redirect_to("comment page") { comment_path(assigns(:comment)) }
      should set_the_flash.to "Successfully updated!"

      should "update the record" do
        @comment.reload
        assert_equal 'My new comment', @comment.body
      end
    end

    context "that fails" do
      setup do
        Comment.any_instance.stubs(:update_attributes).returns(false)
        put :update, :id => @comment.id, :comment => {:body => 'My new comment'}
      end

      should assign_to(:object).with_kind_of(Comment)
      should assign_to(:comment).with_kind_of(Comment)
      should respond_with :success
      should render_with_layout :comments
      should render_template :edit
      should_not set_the_flash
    end
  end

  context "on DELETE to :destroy" do
    context "that succeeds" do
      setup do
        delete :destroy, :id => @comment.id
      end

      should assign_to(:comment){ @comment }
      should redirect_to("comments index"){ comments_path }
      should set_the_flash.to "Successfully removed!"
    end

    context "that fails" do
      setup do
        Comment.any_instance.stubs(:destroy).returns(false)
        delete :destroy, :id => @comment.to_param
      end

      should respond_with(:redirect)
      should redirect_to("comment url") { comment_url @comment }
    end
  end
end
