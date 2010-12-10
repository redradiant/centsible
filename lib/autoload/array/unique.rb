module Extensions
  module Array
    module Unique


      def unique_by(key = :id)
        seen = []
        unique = []
        each do |e|
          next if seen.include?(e.send(key.to_sym))
          seen << e.send(key.to_sym)
          unique << e
        end
        unique
      end
      def uniq_by(&block)
        seen = []
        unique = []
        each do |e|
          next if seen.include?(block.call(e))
          seen << block.call(e)
          unique << e
        end
        unique
      end
    end
  end
end

