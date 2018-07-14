class Project < ApplicationRecord
  resourcify

  has_many :users

  validates :title, presence: true
end
