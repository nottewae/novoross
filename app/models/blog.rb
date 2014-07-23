class Blog < ActiveRecord::Base
  has_many :images
  has_many :videos
end
