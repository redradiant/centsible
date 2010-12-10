require_dependency 'cancan'

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    else
      can :read, :all
    end
  end
end
