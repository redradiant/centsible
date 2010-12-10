require 'test_helper'

class SomethingsControllerTest < ActionController::TestCase
  def setup
    @something = somethings :one
  end

  context "actions specified" do
    [:create, :edit, :update, :destroy, :new].each do |action|
      should "not respond to #{action}" do
        assert !@controller.respond_to?(action)
      end
    end
  end
end
