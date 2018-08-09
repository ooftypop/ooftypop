class Project < ApplicationRecord

  has_many :images, as: :imageable, dependent: :destroy

  accepts_nested_attributes_for :images

  validates :title, presence: true
end
