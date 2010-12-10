module Arspy
  module Delegators
    module AssociationCollectionExtensions
      def self.included(base)
        base.define_chained_method(:method_missing, :arspy) do |symbol, *args|
          load_target unless loaded?
          result = Arspy::Operators.interpret(@target, symbol, *args)
          result = method_missing_without_arspy(symbol, *args) unless result
          result
        end
      end
      def la(*args)
        load_target unless loaded?
        Arspy::Operators.list_associations(@target.first, *args) unless @target.emtpy?
      end
      def lf(*args)
        load_target unless loaded?
        Arspy::Operators.list_fields(@target.first, *args) unless @target.empty?
      end
      def pr(*args)
        load_target unless loaded?
        Arspy::Operators.print_array(@target, *args)
      end
      def ap(opts={})
        load_target unless loaded?
        Arspy::Operators.awesome_print(@target, opts) unless @target.empty?
      end
      def wi(*args)
        load_target unless loaded?
        Arspy::Operators.with(@target, *args)
      end
      def wo(*args)
        load_target unless loaded?
        Arspy::Operators.without(@target, *args)
      end
    end
  end
end