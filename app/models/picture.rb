class Picture < ApplicationRecord
  mount_uploader :photo, ImageUploader
  belongs_to :user
end
