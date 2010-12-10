require 'arspy/operators/selector/base'
require 'arspy/operators/selector/attribute_selector'
require 'arspy/operators/selector/range_selector'
require 'arspy/operators/selector/integer_selector'
require 'arspy/operators/selector/string_selector'
require 'arspy/operators/selector/unsupported_selector'
require 'arspy/operators/selector/hash_selector'

module Arspy
  module Operators

   module Selector
      @@selector_classes = [
        IntegerSelector,
        RangeSelector,
        StringSelector,
        HashSelector,
        UnsupportedSelector
      ]

      def self.for(arg)
        @@selector_classes.detect{|klass| klass.applies?(arg)}.new(arg)
      end


    end
  end
end