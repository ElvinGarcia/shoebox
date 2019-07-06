# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :find_post, only: [:edit,:update,:destroy]
  before_action :find_user, only: [:show,:index]

  def index
    #paginates the user's posts
    @posts = @user.posts.paginate(page: params[:page])
  end

  def new
    @post = Post.new
  end

  def create
     @post = current_user.posts.create(post_strong_params)
    if !@post.persisted?
     render 'new' 
    else
     flash[:notice]="The Post Was Saved Succesfully"
    redirect_to user_path(current_user)
    end
  end 

  def show
    @post = @user.posts.find(params[:id])
  end

  def edit
  end

  def update
    @post.update(post_strong_params)
    params[:post][:images_to_delete]&.each do |id|
      image = @post.images.find(id)
      image.purge
    end
    redirect_to user_post_path(current_user, @post)
  end

  def destroy
    @post.destroy
    redirect_to user_path(current_user)
  end

  private

  def post_strong_params
    params.require(:post).permit(:date, :description, :title, images: [])
  end

  def find_post
    @post = Post.find(params[:id])
  end
  
  def find_user
    @user = User.find(params[:user_id])
  end
  

end
