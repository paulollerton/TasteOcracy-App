class User < ApplicationRecord

  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

  has_many :votes
  has_many :suggestions
  has_many :comments
  has_many :recipes
  
end
