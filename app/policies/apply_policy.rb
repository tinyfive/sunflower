class ApplyPolicy < ApplicationPolicy
  def create?
    user.admin? || user.organization.hospital?
  end

  def update?
    user.admin? || (user.organization.hospital? && record.draft?)
  end

  def approve?
    return false if record.rejected?

    user.admin? \
    || (user.fund? && record.radio_approved?) \
    || (user.radio? && record.volunteer_approved?) \
    || (user.volunteer? && record.submitted?)
  end

  class Scope < Scope
    def resolve
      if user.normal?
        if user.hospital?
          scope.where(hospital: user.organization)
        elsif user.volunteer?
          scope.where(status: %i[submitted volunteer_approved radio_approved])
        elsif user.radio?
          scope.where(status: %i[volunteer_approved radio_approved fund_approved])
        elsif user.fund?
          scope.where(status: %i[radio_approved fund_approved])
        end
      else
        scope.all
      end
    end
  end
end
