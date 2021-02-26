class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  def self.authenticate(email, submitted_password)
    user = find_by(email: email)
    return nil if user.nil?
    return user if user.authenticate(submitted_password)
  end
end
