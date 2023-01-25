class User < ApplicationRecord

  before_save {self.nick = self.nick.downcase}
  validates :name, presence: true, length: {maximum: 50}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :nick, presence: true, length: {maximum: 150}, format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}

  has_secure_password
  validates :password,  length: {minimum: 6}, allow_blank: true

end
