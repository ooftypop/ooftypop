class UserRole < ApplicationRecord

  # before_save :build_project_roles

  belongs_to :user
  belongs_to :role
  belongs_to :project

  # def build_project_roles
  #   Project.save_roles
  # end
end
