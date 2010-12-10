# Nested and Polymorphic Resource Helpers
#
module ResourceController
  module Helpers
    module Nested
      protected
        # Returns the relevant association proxy of the parent. (i.e. /posts/1/comments # => @post.comments)
        #
        def parent_association
          @parent_association ||= parent_object.send(model_name.to_s.pluralize.to_sym)
        end

        # Returns the type of the current parent
        #
        def parent_type
          @parent_type ||= parent_type_from_params || parent_type_from_request
        end

        # Returns the type of the current parent extracted from params
        #
        def parent_type_from_params
          [*belongs_to].find { |parent| !params["#{parent}_id".to_sym].nil? }
        end

        # Returns the type of the current parent extracted form a request path
        #
        def parent_type_from_request
          [*belongs_to].find { |parent| request.path.split('/').include? parent.to_s }
        end

        # Returns true/false based on whether or not a parent is present.
        #
        def parent?
          !parent_type.nil?
        end

        # Returns true/false based on whether or not a parent is a singleton.
        #
        def parent_singleton?
          !parent_type_from_request.nil? && parent_type_from_params.nil?
        end

        # Returns the current parent param, if there is a parent. (i.e. params[:post_id])
        def parent_param
          params["#{parent_type}_id".to_sym]
        end

        # Like the model method, but for a parent relationship.
        #
        def parent_model
          parent_type.to_s.camelize.constantize
        end

        # Returns the current parent object if a parent object is present.
        #
        def parent_object
          # hack by sean to allow permalink parents
          parent? && !parent_singleton? ? parent_model_find(parent_param) : nil
        end

        # Finds parent model by id or param
        #
        def parent_model_find(parent_param)
          if (Integer(parent_param) rescue false)
            parent_model.find(parent_param)
          else
            if parent_model.respond_to? :find_by_param!
              parent_model.find_by_param!(parent_param)
            elsif parent_model.respond_to? :find_by_permalink
              parent_model.find_by_permalink(parent_param)
            end
          end
        end

        # If there is a parent, returns the relevant association proxy.  Otherwise returns model.
        #
        def end_of_association_chain
          parent? ? parent_association : model
        end
    end
  end
end
