class UserPolicy < ApplicationPolicy

  def index?
    user.has_role? :admin
  end

  def show?
    user.has_role? :admin || user.where(id: user.id)
  end

  def new
    create?
  end

  def create?
    user.has_role? :admin
  end

  def update?
    user.has_role? :admin || user.where(id: user.id)
  end

  def edit?
    update?
  end

  def destroy?
    user.has_role? :admin
  end
end
