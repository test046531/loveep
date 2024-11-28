require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  # テストケースのセットアップ
  setup do
    @user = users(:one)
    prepare_test_files
    create_test_files
  end

  # indexアクションのテスト
  test "should get index" do
    get posts_path
    assert_response :success, "indexアクションを正常に実行できません"
  end

  # newアクションのテスト
  test "should get new" do
    get new_post_path
    assert_response :success, "newアクションを正常に実行できません"
  end

  # createアクションのテスト
  test "should create post" do
  end

  # 許可されたパラメータは受け取ります
  # 投稿後は正常にリダイレクトできます
  test "should receive valid post" do
    assert_difference "Post.count", 1, "許可されたパラメータが受け取れません" do
      post posts_path, params: {
        post: {
          content: "valid content",
          user_id: @user.id,
          image_name: fixture_file_upload(@test_svg, "image/svg")
        }
      }
    end
    assert_redirected_to posts_path, "正常にリダイレクトできません"
  end

  # 許可されていないパラメータは受け取りません
  test "should not receive invalid post" do
    post posts_path, params: {
      post: {
        content: "invalid content",
        user_id: @user.id,
        image_name: fixture_file_upload(@test_svg, "image/svg"),
        admin: true
      }
    }
    assert_not Post.last.attributes.key?(:admin), "許可されていないパラメータが受け取られました"
  end

  # 投稿が失敗した場合はnewページに戻ります
  test "should render new when post creation fails" do
    assert_no_difference "Post.count", "空の投稿が成功しています" do
      post posts_path, params: {
        post: {
          content: nil,
          user_id: @user.id,
          image_name: fixture_file_upload(@test_svg, "image/svg")
        }
      }
    end
    assert_template :new, "newページに戻れません"
  end
end
