class ReviewPolicy < ApplicationPolicy
  def destroy?
    # user.has_role?(:seller) && record.reviewable.user_id == user.id || user.has_role?(:user) && record.user_id == user.id
    user.has_role?(:admin)
  end

  def update?
    user.has_role?(:user) && record.user_id == user.id
  end

  def create?
    user.has_role?(:user)
  end
end
