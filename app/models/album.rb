class Album < ActiveRecord::Base
  attr_accessible :images_count, :name, :user_id
  
  has_many :photos, :dependent => :destroy
  belongs_to :user
  
  #Validations
  validates :name, presence: true
  validates :name, uniqueness: true
end
