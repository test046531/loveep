require "test_helper"

class UserTest < ActiveSupport::TestCase
    # テストケースのセットアップ
    def setup
      @user = users(:one)
      @user.password = "foobar"
      @user.password_confirmation = "foobar"
    end
    
    # セットアップユーザーが有効かどうか
    test "should be valid" do
      assert @user.valid?
    end
  
    # ユーザーの名前が長すぎるとエラー
    test "name should not be too long" do
      @user.name = "a" * 51
      assert_not @user.valid?
    end
    # emailが長すぎるとエラー
    test "email should not be too long" do
      @user.email = "a" * 244 + "@example.com"
      assert_not @user.valid?
    end
    # 有効じゃないemailだとエラー
    test "email validation should reject invalid addresses" do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                            foo@bar_baz.com foo@bar+baz.com]
      invalid_addresses.each do |invalid_address|
        @user.email = invalid_address
        assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
      end
    end
    # emailの一意性チェック
    test "email addresses should be unique" do
      duplicate_user = @user.dup
      duplicate_user.email = @user.email.upcase
      @user.save
      assert_not duplicate_user.valid?
    end
    # パスワードが空だとエラー
    test "password should be present (nonblank)" do
      @user.password_digest =  " " * 6
      assert_not @user.valid?
    end
     # パスワードが5文字以下だとエラー
    test "password should have a minimum length" do
      @user.password_digest = "a" * 5
      assert_not @user.valid?
    end
    
    test "password should be present (nonblank)" do
      @user.password = @user.password_confirmation = " " * 6
      assert_not @user.valid?
    end
    test "password should have a minimum length" do
      @user.password = @user.password_confirmation = "a" * 5
      assert_not @user.valid?
    end

end
