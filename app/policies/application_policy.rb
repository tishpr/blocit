class ApplicationPolicy
  attr_reader :user, :record
                                      #ApplicationPolicy is a pure Ruby object that gets
                                      # instantiated with a user (the current_user from Devise, for instance),
                                      # and a record (a post, comment or topic, ).
  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    #scope.where(:id => record.id).exists?
    scope.where(id: record.id).exists?
  end

  def create?  # resource creation, the default rule is of no-access
    #false
     user.present?
  end

  def new?       #same is true for viewing the new action (as in /posts/new).
    create?              # And since they're related actions, new? just calls create?, keeping things DRY.
   end 
  

  def update?
    can_moderate?(user, record)
  end

  def edit?
    update?
  end
  

  def destroy?
    #false
     update?
  end

  def scope  #Pundit defines a scope method which is used as a base for model searches. 
    record.class  #For example, it was used in the definition of show?
  end

  

  #def can_moderate?(user, record)
  #user == record.user || user.role?(:admin) || user.role?(:moderator)
#end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
  
private
  def can_moderate?(user, record)
    (record.user == user || user.moderator? || user.admin?)
  end


end

