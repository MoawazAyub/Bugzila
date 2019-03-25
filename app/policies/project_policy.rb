class ProjectPolicy < ApplicationPolicy

  class Scope < Scope
    attr_reader :user, :scope

    def initialize(user, scope, project = [])
      @user  = user
      @scope = scope
      @project = project
    end

    def resolve
      @temp = []
      scope.each do |project|
        if project.users.include? user
          @temp << project
        end
      end
      scope = @temp
      
    end

    def user_resolve
      @temp = []
      if user.role != 'manager'
        return @temp
      end
      scope.each do |my_user|
        if !((my_user.role == 'manager') || (@project.users.include? my_user))
          @temp << my_user
        end
      end
      scope = @temp
      
    end

  end

  def show?
    if record.users.include? user
      return true
    end
    false
  end

  def index?
  	if user.present?
  		return true
    end
    false
  end

  def edit?
    update?
  end

  def update?
    isAdmin
  end

  def create?
    isAdmin
  end

  def new?
    create?
  end

  private

  def isAdmin
  	if user.present? && user.role == 'manager'
    	return true
    end
    false
  end


end