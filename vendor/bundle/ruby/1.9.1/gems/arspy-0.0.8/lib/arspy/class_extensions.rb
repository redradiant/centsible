module Arspy
  module ClassExtensions
    module ActiveRecord
      module Base
        def la(*args); Arspy::Operators.list_associations(self, *args); end
        def lf(*args); Arspy::Operators.list_fields(self, *args); end
        def pr; Arspy::Operators.awesome_print(self); end
        def ap(opts={}); Arspy::Operators.awesome_print(self, opts); end
      end
    end
  end
end
