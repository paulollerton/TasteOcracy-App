class Suggestion < ApplicationRecord

  belongs_to :recipe
  has_many :votes
  
end
