require "test_helper"

class PostImageUploaderTest < ActiveSupport::TestCase
  include CarrierWave::Test::Matchers

  setup do
    PostImageUploader.enable_processing = true
    @post = posts(:one)
    prepare_test_files
    create_test_files
    @uploader = PostImageUploader.new(@post, :image_name)
  end

  teardown do
    PostImageUploader.enable_processing = false
  end

  # 指定したディレクトリにファイルは保存されます
  # 許可された拡張子の画像はアップロードできます
  test "should save into specified directory" do
    expected_path = "tmp/test/uploads/post/image_name/#{@post.id}/test.svg"
    @uploader.store!(File.open(@test_svg))
    assert File.exist?(expected_path), "指定したディレクトリにファイルが保存されていません"
  end

  # 画像が指定されない場合はデフォルト画像に設定されます
  test "should set default image if no image is specified" do
    @uploader.store!(nil)
    assert_equal "../app/assets/images/test.svg", @uploader.url, "デフォルト画像に設定されていません"
  end

  # 許可されていない拡張子の画像はアップロードできません
  test "should not upload not allowed extensions" do
    assert_raises(CarrierWave::IntegrityError, "許可されていない拡張子の画像がアップロードされました") do
      @uploader.store!(File.open(@test_pdf))
    end
  end
end