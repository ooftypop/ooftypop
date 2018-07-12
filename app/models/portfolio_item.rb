class PortfolioItem < ApplicationRecord
  validates :description, :published, :title, presence: true
end
