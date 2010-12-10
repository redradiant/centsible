module Arspy
  module Operators
    module AttributeTest

      class StringTest < Base

        def self.applies?(param)
          param.is_a? String
        end

        def match?(value_or_object)
          case value_or_object
          when ActiveRecord::Base
            value_or_object.instance_eval{ value_or_object }
          else
            value_or_object.to_s == @param rescue nil
          end
        end

      end
    end
  end
end
