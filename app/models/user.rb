require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  validates :email, uniqueness: true
  validates :username, uniqueness: true

  after_save :encrypt_password

  def password
    @password ||= Password.new(password_hash)
  end

  def encrypt_password
    self.password_hash = BCrypt::Password.create(self.password_hash)
  end

end