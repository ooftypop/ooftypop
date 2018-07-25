class User < ApplicationRecord
  include SnoopDogg

  rolify

  devise :invitable, :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  has_many :users_roles

  has_many :projects, through: :user_roles
  
  has_and_belongs_to_many :roles, :join_table => :users_roles

  after_create :default_role

# ===========================================================================================================================================================
# Authorizations ============================================================================================================================================
# ===========================================================================================================================================================
  def any_of? *roles
    roles.each do |role|
      return true if self.has_role? role.to_sym
    end
    return false
  end

  def ooftypop?
    self.any_of? :admin, :developer
  end

# ===========================================================================================================================================================
# Callbacks =================================================================================================================================================
# ===========================================================================================================================================================
  def default_role
    self.add_role(:client) unless self.roles.any?
  end
end
