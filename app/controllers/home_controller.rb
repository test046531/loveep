class HomeController < ApplicationController
    def index
        @posts = Post.order(created_at: :desc).limit(20) # 新しい順に20件取得
    end

    def posts
        @posts = Post.all
    end
end
