class Role < ApplicationRecord
  include SnoopDogg

  has_and_belongs_to_many :users, :join_table => :users_roles

  scopify

# ===========================================================================================================================================================
# Define Roles ==============================================================================================================================================
# ===========================================================================================================================================================
  def self.build_roles
   	{
      admin:     Role.new(name: "admin"),
      client:    Role.new(name: "client"),
      developer: Role.new(name: "developer")
    }
  end

  def self.save_roles
    self.build_roles.each do |k,v|
      v.save if self.where(name: v.name).empty?
    end
  end

  def self.roles
    Role.select(:role).map(&:role).uniq
  end
end
