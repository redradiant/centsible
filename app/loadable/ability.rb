require_dependency 'cancan'

class Ability
  include CanCan::Ability

  def initialize(user)
    can(:public, :all)
    return false unless (user.acceptible? rescue false)
    
    can(:debug, :all) if user.has_role?(:developer)
    can(:admin, :all) if user.has_any_role?(:admin, :developer)

    if user.acceptible?
      can(:user, :all)
    end

  end
end
