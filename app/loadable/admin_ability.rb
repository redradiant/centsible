class AdminAbility
  include CanCan::Ability
  def initialize(user)
    if ((user.acceptable? && user.has_any_role?(:admin, :developer)) rescue false)
      can [:debug, :admin, :user, :public], :all
    end
  end
end
