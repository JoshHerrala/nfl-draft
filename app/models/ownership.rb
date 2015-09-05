class Ownership < ActiveRecord::Base
  belongs_to :player
  belongs_to :team
  
  validates :round, :pick, :team_id, presence: true
end
