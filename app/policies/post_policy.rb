class PostPolicy < ApplicationPolicy

  # post is edited only under 2 conditions:
  # a. post is approved but it’s admin user
  # b. post is not approved and it’s the post owner

  def update?
    return true if post_approved? && admin?
    return true if user_or_admin && !post_approved?
  end

  def approve?
    admin?
  end

  private

  def user_or_admin
    record.user_id == user.id || admin?
  end

  def admin?
    admin_types.include?(user.type)
  end

  def post_approved?
    record.approved?
  end

end
