class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    def new
        @Post = Post.new
    end

    def create
        #validates the post info
        #sends it to the post model for validation
        #the model sends it to the cloud for storage
        #redirects to the post shwo page
        binding.pry
    end

    def show
        @pic = current_pic
    end
    
    def delete
         @pic = current_pic
         @pic.purge
         redirect_to root_path
    end

end