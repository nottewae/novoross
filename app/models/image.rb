class Image < ActiveRecord::Base
  belongs_to :blog
  mount_uploader :image, ImageUploader
end
