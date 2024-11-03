class Post < ApplicationRecord
  belongs_to :user  # user_idの存在のvalidationはbelongs_toに含まれています
  mount_uploader :image_name, PostImageUploader
  validates :content, presence: true, length: { maximum: 400 }
end
