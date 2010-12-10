module Extensions
  module Array
    module Selection


    
      def without(*args)
        items = args.flatten.compact.uniq.map(&:to_sym)
        self.reject { |e| items.include?(e.to_sym) }
      end
    
      def only(*args)
        items = args.flatten.compact.uniq.map(&:to_sym)
        self.select { |e| items.include?(e.to_sym) }
      end
    
    
      def include_by_id?(element)
        element = element.respond_to?(:id) ? element.id.to_s : element.to_s
        self.collect { |e| e.id.to_s }.include?(element)
      end
    
      def include_by?(element, &block)
        element = element.respond_to?(:id) ? element.id.to_s : element.to_s
        self.map(&block).include?(element)
      end
    
    end
  end
end

