class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.handy
        scope.where(sender: user)
      else
        scope.where(reseiver: user)
      end
    end
  end

  def inbox?
    true
  end

  def index?
    true
  end

  def new?
    true
  end

  def create?
    true
  end
end
