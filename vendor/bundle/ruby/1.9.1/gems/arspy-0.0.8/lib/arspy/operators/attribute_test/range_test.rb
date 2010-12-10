module Arspy
  module Operators
    module AttributeTest


      class RangeTest < Base

        def self.applies?(param)
          param.is_a? Range
        end

        def match?(value_or_object)
          case value_or_object
          when ActiveRecord::Base
            @param.include?(value_or_object.id)
          else
            @param.include?(value_or_object.to_i)
          end
        end
      end

    end
  end
end
