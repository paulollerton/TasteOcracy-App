class Suggestion < ApplicationRecord

  belongs_to :recipe
  has_many :votes

  def total_votes

    votes.sum(:vote_value)
    
  end
  
end
