module Arspy
  module Operators
    module Selector
      class UnsupportedSelector < Base
        def self.applies?(arg)
          true
        end
        def initialize(arg)
          raise "#{arg.inspect} not supported."
        end
        def select?(obj)
          nil
        end
      end
    end
  end
end
