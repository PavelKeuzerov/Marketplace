class ProductPolicy < ApplicationPolicy
  def update?
    user.has_role?(:seller) && record.user_id == user.id
  end

  def destroy?
    user.has_role?(:seller) && record.user_id == user.id
  end

  def create?
    user.has_role?(:seller)
  end
end
