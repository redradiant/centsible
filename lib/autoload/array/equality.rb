module Extensions
  module Array
    module Equality


      def equal_by_key?(*args)
        key = args.first.kind_of?(Symbol) ? args.unshift : :id
        key = key.to_sym
        array = *args
        self.map(&key).sort.map(&:to_s) == array.map(&key).sort.map(&:to_s)
      end
    end
  end
end
