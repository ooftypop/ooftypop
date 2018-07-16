class PortfolioItemPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

  def new
    create?
  end

  def create?
    true
  end

  def update?
    true
  end

  def edit?
    update?
  end

  def destroy?
    true
  end
end
