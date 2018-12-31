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

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        @post.update(post_strong_params)
        if params[:post][:images_to_delete]
            params[:post][:images_to_delete].each do |id|
                image = @post.images.find(id)
                image.purge_later
            end
        end
        redirect_to 'show'
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