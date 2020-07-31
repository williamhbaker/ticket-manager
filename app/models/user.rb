class User < ApplicationRecord

  has_secure_password

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, 
    format: { with: /\w+@\w+\.\w+/}
  validates :password, presence: true, on: :create, length: {minimum: 8}
end
