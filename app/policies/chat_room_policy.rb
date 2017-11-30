class ChatRoomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.handy
        scope.all.where(handy: user)
      else
        scope.all.where(client: user)
      end
    end
  end
end
