class Team < ActiveRecord::Base
  has_many :ownerships
  has_many :players, through: :ownerships 
  
  validates :name, presence: true

  validates :division, presence: true

  has_attached_file :logo , :styles => { :small => '10>', :medium => '40>', :large => '60>' }
  validates_attachment_content_type :logo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
 



end
