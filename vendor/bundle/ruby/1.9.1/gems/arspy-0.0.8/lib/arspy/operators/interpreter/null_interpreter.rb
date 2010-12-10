module Arspy
  module Operators
    module Interpreter
      class NullInterpreter < Base
        def self.applies?(array, method_name)
          true
        end
        def interpret(*args); nil; end
      end
    end
  end
end
