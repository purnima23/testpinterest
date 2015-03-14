class Post < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  has_many :comments
  mount_uploader :file, PhotoUploader
end
