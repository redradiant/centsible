module Abbreviations
  def self.included(base)
    base.extend(ClassMethods)
  end

  def resolve_abbreviation_for_attributes_and_associations!(object, method_name)
    self.class.resolve_abbreviation_for_attributes_and_associations!(object, method_name)
  end
  module ClassMethods
    def resolve_abbreviation_for_attributes_and_associations!(object, method_name)
      klass = object.class
      setup_abbreviations(object) unless object.instance_variable_defined?('@arspy_abbreviations')
      if (ambiguity = klass.instance_variable_get('@arspy_ambiguous_abbreviations')[method_name])
        raise "Ambiguous abbreviation '#{ambiguity[:abbr]}' could be #{quote_and_join(ambiguity[:methods])}"
      end
      klass.instance_variable_get('@arspy_abbreviations')[method_name]
    end

    def setup_abbreviations(object)
      associations = object.class.reflect_on_all_associations.map(&:name).map(&:to_sym)
      attributes = object.attribute_names.map(&:to_sym)
      assoc_descriptors = associations.map{|method_name| {:method_name=>method_name, :type=>:association, :abbr=>abbreviate_method_name(method_name)}}
      attrib_descriptors = attributes.map{|method_name| {:method_name=>method_name, :type=>:attribute, :abbr=>abbreviate_method_name(method_name)}}
      all_descriptors = assoc_descriptors + attrib_descriptors
      object.class.instance_variable_set('@arspy_ambiguous_abbreviations', remove_ambiguities(all_descriptors))
      object.class.instance_variable_set('@arspy_abbreviations', Hash[*all_descriptors.map{|desc| [desc[:abbr], desc] }.flatten])
    end
    def remove_ambiguities(descriptors)
      list={}
      ambiguities = {}
      descriptors.each do |desc|
        if list.include?(desc[:abbr])
          if ambiguities[desc[:abbr]]
            ambiguities[desc[:abbr]][:methods] << desc[:method_name]
          else
           ambiguities[desc[:abbr]] = {:abbr=>desc[:abbr], :methods=>[desc[:method_name]]}
           ambiguities[desc[:abbr]][:methods] << list[desc[:abbr]][:method_name]
          end
        else
          list[desc[:abbr]] = desc
        end
      end
      descriptors.reject!{|desc| ambiguities.map{|hash| hash.first}.include?(desc[:abbr])}
      ambiguities
    end
    def abbreviate_method_name(method_name)
      words = method_name.to_s.split('_')
      abbr=[]
      if words.first == ''
        abbr << '_'
      end
      words.reject!{|word| word == ''}
      abbr += words.map do |word|
        chars = word.split(//)
        first = chars.shift
        [first, chars.map{|ch| ch =~ /[0-9]/ ? ch : nil}].compact.flatten.join('')
      end

      abbr << '_' if (method_name.to_s =~ /_$/)
      abbr.join('').to_sym
    end
    def quote_and_join(array)
      return "'#{array.first}'" if array.size == 1
      last = array.pop
      "'#{array.join("', '")}' or '#{last}'"
    end
  end
end