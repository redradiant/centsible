require 'arspy/operators/attribute_test/base'
require 'arspy/operators/attribute_test/integer_test'
require 'arspy/operators/attribute_test/range_test'
require 'arspy/operators/attribute_test/regexp_test'
require 'arspy/operators/attribute_test/string_test'
require 'arspy/operators/attribute_test/unsupported_test'

module Arspy
  module Operators
    module AttributeTest
      @@attribute_test_classes = [
        IntegerTest, RangeTest, StringTest, RegexpTest, UnsupportedTest
      ]

      def self.for(param)
        @@attribute_test_classes.detect{|klass| klass.applies?(param)}.new(param)
      end

    end  end
end
