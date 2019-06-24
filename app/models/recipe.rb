class Recipe < ApplicationRecord

  has_many :suggestions
  has_many :comments
  belongs_to :user
  
end
