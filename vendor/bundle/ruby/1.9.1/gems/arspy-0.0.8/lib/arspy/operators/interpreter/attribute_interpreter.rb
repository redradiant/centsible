module Arspy
  module Operators
    module Interpreter
      class AttributeInterpreter < Base

        def self.applies?(array, method_name)
          array.first.attribute_names.include?(method_name.to_s)
        end

        def interpret(*args)
          return @array.map(&@method_name) if args.empty?
          raise 'Hash not supported as attribute conditionals' if args.any?{|arg| arg.is_a?(Hash)}
          selector = Selector.for({@method_name => args})
          @array.select{|obj| obj && selector.select?(obj)}
        end

      end
      
    end
  end
end
