module ActiveAdmin
  class PagePolicy < ApplicationPolicy
    def show?
      user.has_role? :admin
    end
  end
end
