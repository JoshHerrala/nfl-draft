class Player < ActiveRecord::Base
  has_one :team, through: :ownership
  has_one :ownership
  
  validates :name, presence: true
  validates :surname, presence: true
  validates :position, presence: true
  
  def full_name
    "#{name} #{surname}"
  end
end
