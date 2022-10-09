class Blog < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :title, presence: true
  validates :content, presence: true, length: { maximum:60 }
end
