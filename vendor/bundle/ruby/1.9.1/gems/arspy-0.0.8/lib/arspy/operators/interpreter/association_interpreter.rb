module Arspy
  module Operators
    module Interpreter

      class AssociationInterpreter < Base

        def self.applies?(array, method_name)
          array.first.class.reflect_on_all_associations.detect{|a| a.name == method_name}
        end

        def interpret(*args)
          @array.map(&@method_name).flatten
        end
      end

    end
  end
end
