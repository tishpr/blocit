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

   def show?
              #new rule to the TopicPolicy so that private topics
              # will only be visible to signed-in users:
     record.public? || user.present?
   end

 end



 