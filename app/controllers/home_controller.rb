class HomeController < ApplicationController
    def index
        @posts = Post.limit(20) # 取得投稿数を20に制限
    end

    def posts
        @posts = Post.all
    end
end
