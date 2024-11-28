class Post < ApplicationRecord
  belongs_to :user  # user_idの存在のvalidationはbelongs_toに含まれています
  # 複数画像を添付
  has_many_attached :images
  #mount_uploader :image_name, PostImageUploader
  validates :content, presence: true, length: { maximum: 400 }
  validates :user_id, presence: true
  validate :validate_images # 画像数のバリデーションを追加

  private
  # 最大5枚まで画像をアップロードできるようにバリデーション
  def validate_images
    if images.attached? && images.length > 5
      error.add(:images, "は最大5枚までアップロードできます")
    end
  end
end
