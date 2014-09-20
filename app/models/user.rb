class User < ActiveRecord::Base

  before_save {self.email = email.downcase}

  VALIDATE_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true
  validates :email, presence: true, format: {with: VALIDATE_EMAIL}, uniqueness: {case_sensitive: false}

  validates :password, length: {minimum: 6}

  has_secure_password
end
