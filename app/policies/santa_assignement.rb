class GroupMemberPolicy < ApplicationPolicy
  attr_reader :user, :record, :group
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def new?
    true
  end

  def create?
   true
  end

  def destroy?
    true
  end
end
