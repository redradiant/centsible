module Arspy
  module Delegators
    module ActiveRecordExtensions
      def la(*args); Arspy::Operators.list_associations(self.class, *args); end
      def lf(*args); Arspy::Operators.list_fields(self.class, *args); end
      def pr(*args); Arspy::Operators.print_object(self, *args); end
      def ap(opts={}); Arspy::Operators.awesome_print(self, opts); end
    end
  end
end