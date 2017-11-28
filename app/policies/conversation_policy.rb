class ConversationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.conversations
    end
  end
end
