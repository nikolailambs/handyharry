class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.handy
        scope.where(handy: user)
      else
        scope.where(client: user)
      end
    end
  end

  def show?
    true
  end

  def destroy?
    true
  end

  def update?
    true
  end

  def edit?
    true
  end

  def new?
    user.handy == false
  end

  def create?
    user.handy == false
  end
end
