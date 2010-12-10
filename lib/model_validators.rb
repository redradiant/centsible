require_dependency 'active_model/validator'

class ReduceValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return until record.errors.has_key?(attribute)
    record.errors[attribute].slice!(-1) until record.errors[attribute].size <= 1
  end
end


class CardValidator < ActiveModel::Validator
  def validate(record)
    record # => The person instance being validated
    options # => Any non-standard options passed to validates_with
    record.cc.validate
    record.cc.errors.each do |attribute, errors|
      errors.as_array.each do |e|
        record.errors.add(attribute, e)
      end
    end
    record.valid?
  end
end
