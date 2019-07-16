class Vote < ApplicationRecord

  validates :vote_count, uniqueness: true

  belongs_to :suggestion
  belongs_to :user
  
end
