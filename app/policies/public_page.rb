class GroupPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
    end
  end

  def show?
    true
  end

  def index?
    true
  end

end
