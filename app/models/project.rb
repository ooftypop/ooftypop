class Project < ApplicationRecord

  has_many :projects_users
  has_many :users, through: :projects_users

  accepts_nested_attributes_for :projects_users

  validates :title, presence: true
end
