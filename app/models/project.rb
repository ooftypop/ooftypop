class Project < ApplicationRecord
  resourcify

  has_many :user_roles
  has_many :users, through: :user_role

  validates :title, presence: true

  # accepts_nested_attributes_for :user_role
end
