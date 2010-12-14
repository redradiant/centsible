class UserLocation < ActiveRecord::Base

  has_one :location, :as => :locatable
  #acts_as_mappable :through => :location

  belongs_to :user
end
