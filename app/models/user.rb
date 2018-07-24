class User < ApplicationRecord
  include SnoopDogg
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  rolify
  devise :invitable, :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  has_many :user_roles
  has_many :projects, through: :user_role

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
