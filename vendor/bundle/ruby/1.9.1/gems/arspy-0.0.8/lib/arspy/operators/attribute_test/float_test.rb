module Arspy
  module Operators
    module AttributeTest


      class FloatTest < Base

        def self.applies?(param)
          param.is_a? Float
        end

        def match?(value_or_object)
          case value_or_object
          when ActiveRecord::Base
            false
          else
            value_or_object.to_f == @param rescue nil
          end
        end
      end

    end
  end
end
