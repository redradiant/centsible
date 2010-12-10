module Arspy
  module Operators
    module AttributeTest


      class IntegerTest < Base

        def self.applies?(param)
          param.is_a? Integer
        end

        def match?(value_or_object)
          case value_or_object
          when ActiveRecord::Base
            value_or_object.id == @param
          else
            value_or_object.to_i == @param rescue nil
          end
        end
      end

    end
  end
end
