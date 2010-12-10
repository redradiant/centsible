batch_load("lib/autoload/array/*.rb")

class Array
  include Extensions::Array::Conversion
  include Extensions::Array::Equality
  include Extensions::Array::Selection
  include Extensions::Array::Unique
end
