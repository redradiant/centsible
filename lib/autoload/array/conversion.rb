module Extensions
  module Array
    module Conversion


      def to_proc
         Proc.new { |*args| args.shift.__send__(self.first, *(args + self[1..-1])) }
      end
    end
  end
end
