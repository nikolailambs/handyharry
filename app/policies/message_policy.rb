class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.handy
        scope.where(handy: user)
      else
        scope.where(client: user)
      end
    end
  end
end
