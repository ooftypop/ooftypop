class PortfolioItem < ApplicationRecord

  validates :description, presence: true
  validates :published,   presence: true
  validates :title,       presence: true
  validates :url,         presence: true

end
