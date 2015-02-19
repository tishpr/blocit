 class TopicPolicy < ApplicationPolicy
 
   def index?
     true
   end
 
   def create?
     user.present? && user.admin?
   end
 
   def update?
     create?
   end

   def destroy?
    create?#can_moderate?(user, record)
   end
 end



 # this was in create?   