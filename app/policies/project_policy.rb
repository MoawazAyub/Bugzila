class ProjectPolicy < ApplicationPolicy

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