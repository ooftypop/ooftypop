class Project < ApplicationRecord

  has_many :users, through: :user_projects

  validates :title, presence: true
end
