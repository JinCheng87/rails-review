class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews

  validates :email, presence: true
  validates :password_digest, presence: true
  validates :name, presence: true
end