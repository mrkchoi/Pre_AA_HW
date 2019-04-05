# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :username, uniqueness: true
  validates :username, :password_digest, :session_token, presence: true
  after_initialize :validate_session_token

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = self.generate_session_token
    self.save
    self.session_token
  end

  def generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def validate_session_token
    self.session_token ||= self.generate_session_token
  end

end
