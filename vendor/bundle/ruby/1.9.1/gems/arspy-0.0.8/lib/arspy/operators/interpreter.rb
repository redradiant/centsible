
require 'arspy/operators/interpreter/base'
require 'arspy/operators/interpreter/association_interpreter'
require 'arspy/operators/interpreter/attribute_interpreter'
require 'arspy/operators/interpreter/method_interpreter'
require 'arspy/operators/interpreter/abbreviated_association_interpreter'
require 'arspy/operators/interpreter/abbreviated_attribute_interpreter'
require 'arspy/operators/interpreter/null_interpreter'

module Arspy
  module Operators
    module Interpreter
      @@interpreter_classes = [
        AssociationInterpreter, AttributeInterpreter,
        MethodInterpreter, AbbreviatedAssociationInterpreter,
        AbbreviatedAttributeInterpreter,
        NullInterpreter
      ]

      def self.for(array, method_name)
        return NullInterpreter.new(array, method_name) unless (array && method_name && array.is_a?(Array) && !array.empty? && array.first.is_a?(ActiveRecord::Base))
        @@interpreter_classes.detect{|klass| klass.applies?(array, method_name)}.new(array, method_name)
      end

      @@abbreviations_enabled = true

    end
  end
end
