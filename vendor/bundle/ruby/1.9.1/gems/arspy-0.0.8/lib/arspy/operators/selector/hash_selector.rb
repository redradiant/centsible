module Arspy
  module Operators
    module Selector

      class HashSelector < Base
        @@hash_selector_classes = [
          Selector::AttributeSelector,
          Selector::UnsupportedSelector
        ]
        def self.applies?(arg)
          arg.is_a? Hash
        end

        def select?(obj)
          selectors.any?{|selector| selector.select?(obj) }
        end

        def selectors
          @selectors ||= @argument.map do |key_value|
            hash_selector_class_for(key_value).new(key_value)
          end
        end
        def hash_selector_class_for(key_value)
          @@hash_selector_classes.detect{|klass| klass.applies?(key_value) }
        end

      end
    end
  end
end
