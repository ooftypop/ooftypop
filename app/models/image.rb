class Image < ApplicationRecord
  attachment :file
  belongs_to :imageable, polymorphic: true
end
