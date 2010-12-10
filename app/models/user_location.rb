class UserLocation < ActiveRecord::Base

  belongs_to :location
  acts_as_mappable :through => :location

  belongs_to :user
end
