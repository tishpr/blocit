class CommentPolicy < ApplicationPolicy

  def destroy?
    can_moderate?#user.present? && (record.user == user || user.admin? || user.moderator? )
  end
  
end