class User < ApplicationRecord
  include SnoopDogg

  has_many :projects

  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, :password, presence: true

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
