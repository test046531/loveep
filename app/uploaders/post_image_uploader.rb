class PostImageUploader < CarrierWave::Uploader::Base
  # 開発環境ではファイルを'public/uploads'に保存します
  storage :file

  # 保存するディレクトリを指定します
  def store_dir
    if Rails.env.test?
      "../tmp/test/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    else
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end
  end

  # デフォルトの画像を指定します
  def default_url
    "../app/assets/images/default.svg"
  end

  # 許可する画像の拡張子を指定します
  def extension_allowlist
    ["jpg", "jpeg", "gif", "png", "svg"]
  end

  # ファイルの内容が画像かどうかをチェックします
  def content_type_allowlist
    /image\//
  end

  # 画像のサイズを制限します
  def size_range
    1..5.megabytes
  end
end
