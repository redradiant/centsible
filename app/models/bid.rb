class BidError < RuntimeError
end

class Bid < ActiveRecord::Base

  belongs_to :user
  belongs_to :auction
#  acts_as_tree :order => "bidcount"

end
