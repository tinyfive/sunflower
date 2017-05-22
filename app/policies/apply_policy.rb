class ApplyPolicy < ApplicationPolicy
  class Scope < Scope
    # TODO
    def resolve
      scope
    end
  end
end
