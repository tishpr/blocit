class CommentPolicy < ApplicationPolicy

  def destroy?
    can_moderate?
  end
  
end