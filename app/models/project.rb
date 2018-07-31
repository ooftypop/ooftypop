class Project < ApplicationRecord
  include SnoopDogg
  resourcify

  has_many :users_roles, through: :roles
  has_many :users, through: :users_roles

  accepts_nested_attributes_for :users_roles, allow_destroy: true

  validates :title, presence: true
end
