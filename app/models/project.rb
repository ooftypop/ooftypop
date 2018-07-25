class Project < ApplicationRecord
  include SnoopDogg
  resourcify

  validates :title, presence: true

  # accepts_nested_attributes_for :user_role
end
