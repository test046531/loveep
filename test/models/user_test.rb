require "test_helper"

class UserTest < ActiveSupport::TestCase
    # テストケースのセットアップ
    def setup
      @user = users(:one)
    end
    
    # セットアップユーザーが有効かどうか
    test "should be valid" do
      assert @user.valid?
    end
  
    # ユーザーの名前が存在しないとエラー
    test "name should be present" do
      @user.name = "   "
      assert_not @user.valid?
    end
end
