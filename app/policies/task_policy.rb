class TaskPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(handy: user)
    end
  end

  def create?
    user.handy == true
  end

  def new?
    user.handy == true
  end

  def show?
    user.handy == true
  end

  def update?
    user.handy == true
  end

  def edit?
    user.handy == true
  end

  def destroy?
    user.handy == true
  end
end
