require 'arspy/operators/abbreviations'

module Arspy
  module Operators
    module Interpreter
      class AbbreviatedAttributeInterpreter < AttributeInterpreter
        include Abbreviations

        def self.applies?(array, method_name)
          descriptor = resolve_abbreviation_for_attributes_and_associations!(array.first, method_name)
          descriptor && descriptor[:type] == :attribute
        end

        def initialize(array, method_name)
          descriptor = resolve_abbreviation_for_attributes_and_associations!(array.first, method_name)
          super(array, descriptor[:method_name])
        end

      end
    end
  end
end
