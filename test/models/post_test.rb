require "test_helper"

class PostTest < ActiveSupport::TestCase
  # テストケースのセットアップ
  def setup
    @user = users(:one)
    @post = posts(:one)
  end

  # postはuserに所属しています
  test "post belongs to user" do
    assert_equal @user, @post.user, "postがuserに所属していません"
  end

  # セットアップされた投稿は保存できます
  test "should save valid post" do
    assert @post.valid?, "セットアップされた投稿が保存できません"
  end
  
  # contentが空の投稿は保存できません
  test "should not save post without content" do
    @post.content = ""
    assert_not @post.valid?, "contentが空の投稿が保存できてしまいました"
  end

  # contentが400文字を超える投稿は保存できません
  test "should not save post with content longer than 400 characters" do
    @post.content = "a" * 401
    assert_not @post.valid?, "contentが400文字を超える投稿が保存できてしまいました"
  end

  # user_idが空の投稿は保存できません
  test "should not save post without user_id" do
    @post.user_id = nil
    assert_not @post.valid?, "user_idが空の投稿が保存できてしまいました"
  end
end
