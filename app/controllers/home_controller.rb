class HomeController < ApplicationController
    def index
        @posts = Post.all
    end

    def posts
        @posts = Post.all
    end
end
