class Project < ApplicationRecord

  has_and_belongs_to_many :users, foreign_key: "user_id"

  validates :title, presence: true
end
