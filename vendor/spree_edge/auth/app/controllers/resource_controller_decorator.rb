# This overrides the before method provided by resource_controller so that the current_user is authorized
# for each action before proceding.
module ResourceController
  module Helpers
    module Internal
      protected
      # Calls the before block for the action, if one is present.
      def before(action)

        resource = case action
        when :index, :new, :create
          model
        else object
        end

        authorize! action, resource
        invoke_callbacks *self.class.send(action).before
      end
    end
  end
end
