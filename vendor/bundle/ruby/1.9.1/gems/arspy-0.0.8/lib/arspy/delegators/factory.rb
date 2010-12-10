require 'arspy/delegators/null_extensions'
require 'arspy/delegators/array_extensions'
require 'arspy/delegators/association_collection_extensions'
require 'arspy/delegators/active_record_extensions'

module Arspy
  module Delegators
    module Factory
      def self.module_for(klass)
        case klass.name
        when 'Array' then Arspy::Delegators::ArrayExtensions
        when 'ActiveRecord::Base' then Arspy::Delegators::ActiveRecordExtensions
        when 'ActiveRecord::Associations::HasManyThroughAssociation', 'ActiveRecord::Associations::AssociationCollection'
          then Arspy::Delegators::AssociationCollectionExtensions
        else
          Arspy::Delegators::NullExtensions
        end
      end
    end
  end
end