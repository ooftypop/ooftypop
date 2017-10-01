class Role < ApplicationRecord
  has_and_belongs_to_many :users, :join_table => :users_roles
  belongs_to :resource, :polymorphic => true

  validates :resource_type,
            :inclusion => { :in => Rolify.resource_types },
            :allow_nil => true

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
end
