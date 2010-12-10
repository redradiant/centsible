module Arspy
  module Operators
    module AttributeTest

      class RegexpTest < Base
        def self.applies?(param)
          param.is_a? Regexp
        end

        def match?(value_or_object)
          case value_or_object
          when ActiveRecord::Base
            raise "Test for '#{@param}' on object '#{value_or_object.class.name}' not supported."
          else
            value_or_object =~ @param
          end
        end

      end

    end
  end
end
