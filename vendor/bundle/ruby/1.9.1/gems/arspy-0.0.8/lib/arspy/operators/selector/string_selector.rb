module Arspy
  module Operators
    module Selector
      class StringSelector < Base
        def self.applies?(arg)
          arg.is_a? String
        end
        def select?(obj)
          obj.instance_eval { @argument }
        end
      end
    end
  end
end
