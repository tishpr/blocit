class CommentPolicy < ApplicationPolicy

  def destroy?
    user.present? && (record.user == user || user.admin? || user.moderator? )
  end
  
end