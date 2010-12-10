module Arspy
  module Operators
    module Interpreter

      class MethodInterpreter < AttributeInterpreter
        def self.applies?(array, method_name)
          array.first.respond_to?(method_name) && array.first.method(method_name).arity == 0
        end

      end
    end
  end
end

