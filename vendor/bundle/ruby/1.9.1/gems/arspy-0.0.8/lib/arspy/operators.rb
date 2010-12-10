require 'arspy/operators/attribute_test'
require 'arspy/operators/selector'
require 'arspy/operators/interpreter'

module Arspy
  module Operators

    def self.list_associations(klass_or_object, *args)
      active_record_klass = klass_or_object.is_a?(Class) ? klass_or_object : klass_or_object.class
      return unless active_record_klass.ancestors.include?(ActiveRecord::Base)
      counts = {}
      rows = active_record_klass.reflect_on_all_associations.map do |assoc|
        counts[assoc.macro] ||= 0
        counts[assoc.macro] += 1
        self.format_column_association(assoc)
      end
      rows.sort!{|row1,row2| row1.first <=> row2.first}
      return rows if args.include?(:data)
      self.print_matrix(rows)
      "Total: #{counts.inject(0){|sum, count| sum+count.last}} (" + counts.map{|count| "#{count.last} #{count.first}" }.join(', ') + ")"
    end

    def self.list_fields(klass_or_object, *args)
      active_record_klass = klass_or_object.is_a?(Class) ? klass_or_object : klass_or_object.class
      return unless active_record_klass.ancestors.include?(ActiveRecord::Base)
      rows = active_record_klass.columns.map do |column|
        self.format_column_field(column)
      end
      rows.sort!{|row1,row2| row1.first <=> row2.first}
      return rows if args.include?(:data)
      self.print_matrix(rows)
      "Total #{active_record_klass.columns.size} field#{active_record_klass.columns.size == 1 ? '' : 's'}"
    end

    def self.awesome_print(klass_object_or_array, options={})
      #AwesomePrint.new(options).puts(klass_object_or_array)
      ap(klass_object_or_array)
      nil
    end

    def self.format_column_association(assoc)
      select_options = assoc.options.select{|k,v| [:through, :as, :polymorphic].include?(k)}
      [assoc.name.to_s, assoc.macro.to_s, "(#{assoc.options[:class_name] || assoc.name.to_s.singularize.camelize})", select_options.empty? ? '' : Hash[*select_options.flatten].inspect]
    end
    def self.format_column_field(field)
      [field.name.to_s, ":#{field.type}", format_db_type(field), format_db_type_modifiers(field)]
    end
    def self.format_db_type(field)
      prec_scale = field.precision && field.scale ? "#{field.precision}:#{field.scale}" : ""
      default = field.default ? " (#{field.default})" : ""
      "#{field.sql_type}#{prec_scale}#{default}"
    end
    def self.format_db_type_modifiers(field)
      modifiers = []
      modifiers << 'PRIMARY' if field.primary
      modifiers << 'NOT NULL' unless field.null
      #modifiers << "LIMIT(#{field.limit})" if field.limit
      modifiers.join(',')
    end

    def self.print_array(array, *args)
      if args.empty?
        case array.first
        when ActiveRecord::Base then ap(array)
        else
          array.each{|element| puts element}
        end
      end
      #array.each{|element| puts element.is_a?(String) ? element : element.inspect } if args.empty?
      self.print_matrix(
        array.map do |obj|
          args.map do |arg|
            case arg
            when Symbol then obj.__send__(arg)
            when String then obj.respond_to?(arg) ? obj.__send__(arg) : (obj.instance_eval(arg) rescue nil)
            else nil
            end
          end
        end
      ) unless args.empty?
      nil
    end

    def self.print_object(object, *args)
      print_matrix([args.map{|arg| object[arg]}]) unless args.empty?
      #AwesomePrint.new.puts(object) if args.empty?
      ap(object) if args.empty?
      nil
    end
    def self.test_object(obj, args)
      args.any? do |arg|
        case arg
        when String then obj.instance_eval(arg) rescue false
        when Integer then obj.id == arg
        when Hash
          arg.any?{|key,val| self.test_attribute(obj, key, (val.is_a?(Array) ? val : [val]) ) }
        else
          false
        end
      end
    end
    # t.people.with(20..30)
    # t.people.with(2,3,4)
    # t.people.with(:name=>[/Ed/, /Jen/, 'Joe'])
    # t.people.with(:age=>10..20)
    # t.people.with('statistics.statistic_type.abbrevation'=>%w(GP SV% GAA))
    def self.with(array, *args)
      return array if (args.empty? || array.nil? || array.empty?)
      array.select{|obj| 
        obj && args.any?{|arg|
          Selector.for(arg).select?(obj) }}
    end
    def self.without(array, *args)
      return array if (args.empty? || array.nil? || array.empty?)
      array.select{|obj| obj && !args.any?{|arg| Selector.for(arg).select?(obj) }}
    end

    def self.enable_abbreviations; Interpreter.enable_abbreviations(true); end
    def self.disable_abbreviations; Interpreter.enable_abbreviations(false); end

    def self.interpret(array, method_name, *args)
      Interpreter.for(array, method_name).interpret(*args)
    end


    @@column_padding = 2
    def self.print_matrix(matrix_array)
      return nil if matrix_array.empty?
      raise 'Cannot print a non-matrix array' unless matrix_array.all?{|ar| ar.is_a? Array }

      columns_per_row = matrix_array.map{|ar| ar.size }.max
      init_array = Array.new(columns_per_row, 0)
      max_widths = matrix_array.inject(init_array)do |mw, row|
        row.each_with_index do |string, index|
          mw[index] = [string.to_s.length, mw[index]].max
        end
        mw
      end
      matrix_array.each do |row|
        index = -1
        puts (row.map{|column| column.to_s + ' '*(max_widths[index += 1] - column.to_s.length) }.join(' '*@@column_padding))
      end
      nil
    end
  end
end
