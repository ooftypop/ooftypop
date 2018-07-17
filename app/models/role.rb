class Role < ApplicationRecord
  include SnoopDogg

  has_and_belongs_to_many :users, :join_table => :users_roles

  belongs_to :resource, :polymorphic => true

  scopify

# ===========================================================================================================================================================
# Define Roles ==============================================================================================================================================
# ===========================================================================================================================================================

  def self.selectable_roles
   	{
      admin:          Role.new(name: "admin"),
      client:         Role.new(name: "client"),
      developer:      Role.new(name: "developer"),
      lead_developer: Role.new(name: "lead_developer"),
      jr_developer:   Role.new(name: "jr_developer"),
      manager:        Role.new(name: "manager")
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
