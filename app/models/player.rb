class Player < ActiveRecord::Base
  has_one :team, through: :ownership
  has_one :ownership
  
  validates :name, presence: true
  validates :position, presence: true
  
  def last_name
    self.name.split(' ')[1]
  end

end
