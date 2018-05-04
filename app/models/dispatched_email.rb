class DispatchedEmail < ApplicationRecord

  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :sender_email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}
  # validates :sender_budget, presence: true
  # validates :sender_first_name, presence: true
  # validates :sender_last_name, presence: true
  # validates :sender_phone_number, presence: true
  # validates :sender_body, presence: true

  def downcase_email
    self.email = email.downcase
  end
end
