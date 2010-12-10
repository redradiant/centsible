module Arspy
  module Operators
    module Selector
      class IntegerSelector < Base

        def self.applies?(arg)
          arg.is_a? Integer
        end

        def select?(obj)
          obj.id == @argument
        end

      end
    end
  end
end
