ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # 指定のワーカー数でテストを並列実行する
  parallelize(workers: :number_of_processors)

  # test/fixtures/*.ymlにあるすべてのfixtureをセットアップする
  fixtures :all

  # （すべてのテストで使うその他のヘルパーメソッドは省略）

  # テスト実行後にアップロードされたファイルを削除します
  def after_teardown
    super
    cleanup_test_files
  end

  # テストファイルの準備用のヘルパーメソッドを追加
  def prepare_test_files
    FileUtils.mkdir_p("test/fixtures/files")
  end

  # テストファイルを作成するヘルパーメソッド
  def create_test_files
    # SVGファイルの作成
    @test_svg = 'test/fixtures/files/test.svg'
    File.write(@test_svg, '<svg></svg>')

    # PDFファイルの作成
    @test_pdf = 'test/fixtures/files/test.pdf'
    File.write(@test_pdf, '%PDF-1.5')
  end

  private

  def cleanup_test_files
    [
      "public/uploads/tmp",
      "tmp/test/uploads",
      "test/fixtures/files"
    ].each do |dir|
      FileUtils.rm_rf(dir) if Dir.exist?(dir)
    end
  end
end
