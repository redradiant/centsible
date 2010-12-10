module Arspy
  module Operators
    module Selector
      class RangeSelector < Base

        def self.applies?(arg)
          arg.is_a? Range
        end

        def select?(obj)
          @argument.include?(obj.id)
        end

      end
    end
  end
end
