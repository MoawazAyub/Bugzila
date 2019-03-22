class ProjectPolicy < ApplicationPolicy

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