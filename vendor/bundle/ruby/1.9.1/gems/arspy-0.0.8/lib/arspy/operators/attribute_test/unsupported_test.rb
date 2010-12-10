module Arspy
  module Operators
    module AttributeTest
      class UnsupportedTest < Base

        def self.applies?(param)
          true
        end
  
        def match?(object)
          raise "#{@param.class.name} '#{@param.inspect}' not supported."
        end
      end

    end
  end
end