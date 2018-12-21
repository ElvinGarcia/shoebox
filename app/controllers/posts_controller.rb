class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def create
        current_user.posts.create(post_strong_params)
        redirect_to users_path
    end

    def show
        @post = current_user.posts.find(params[:id])
    end
    
    def delete
         @pic = current_pic
         @pic.purge
         redirect_to root_path
    end

    private

    def post_strong_params
         params.require(:post).permit(:date,:description,images:[])
    end

end