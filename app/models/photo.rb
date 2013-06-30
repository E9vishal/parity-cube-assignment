class Photo < ActiveRecord::Base
  attr_accessible :image, :title, :album_id, :remote_image_url
  
  belongs_to :album
  mount_uploader :image, ImageUploader
  
  validate :max_images_count, on: :create
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :image, presence: true
  
  def max_images_count
    errors[:base] << "Images count can not exceed 25 for an album." if album.images_count >= 25
  end
  
  after_create do |photo|
    photo.album.increment!(:images_count)
  end
  after_destroy do |photo|
    photo.album.decrement!(:images_count)
  end
  
end
