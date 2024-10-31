class Post < ApplicationRecord
  belongs_to :user  # user_idの存在のvalidationはbelongs_toに含まれています
  validates :content, presence: true, length: { maximum: 400 }
end
