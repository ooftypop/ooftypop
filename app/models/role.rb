class Role < ApplicationRecord
  include SnoopDogg

  has_many :user_roles
  has_and_belongs_to_many :users, :join_table => :users_roles

  scopify

# ===========================================================================================================================================================
# Define Roles ==============================================================================================================================================
# ===========================================================================================================================================================
  def self.role_type
   	{
      admin:          Role.new(name: "admin"),
      client:         Role.new(name: "client"),
      developer:      Role.new(name: "developer"),
      jr_developer:   Role.new(name: "jr_developer"),
      lead_developer: Role.new(name: "lead_developer"),
      manager:        Role.new(name: "manager")
    }
  end

  def self.save_roles
    self.role_type.each do |k,v|
      v.save if self.where(name: v.name).empty?
    end
  end
end
