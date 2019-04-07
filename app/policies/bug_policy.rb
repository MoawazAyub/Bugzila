class BugPolicy < ApplicationPolicy
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
    #isQa
    if user.role == 'qa' || user.role == 'developer'
      return true
    end

    false
  end

  def create?
    isQa
  end

  def new?
    create?
  end

  private

  def isQa
  	if user.present? && user.role == 'qa'
    	return true
    end
    false
  end
end