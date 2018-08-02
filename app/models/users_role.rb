class UsersRole < ApplicationRecord
  include SnoopDogg

  belongs_to :user
  belongs_to :role
end
