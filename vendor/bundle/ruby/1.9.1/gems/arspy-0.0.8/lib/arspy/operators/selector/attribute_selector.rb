module Arspy
  module Operators
    module Selector

      class AttributeSelector < Base
        def self.applies?(key_value)
          key_value.first.is_a? Symbol
        end
        def initialize(key_value)
          super
          @attribute = key_value.first.to_sym
          @test_values = key_value.last.is_a?(Array) ? key_value.last : [key_value.last]
        end

        def select?(obj)
          raise "Attribute '#{@attribute}' not found for #{obj.class.name}" unless obj.attribute_names.include?(@attribute.to_s)
          response = obj.__send__ @attribute
          return nil unless response
          raise "Attributes resulting in arrays not supported" if response.is_a?(Array)
          response = [response] unless response.is_a?(Array)
          response.any?{|value_or_object| attribute_tests.any?{|test| test.match?(value_or_object)}}
        end

        def attribute_tests
          @attribute_tests ||= @test_values.map do |param|
            AttributeTest.for(param)
          end
        end

      end
    end
  end
end
