# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    current_user.posts.create(post_strong_params)
    redirect_to user_path(current_user)
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
    params[:post][:images_to_delete]&.each do |id|
      image = @post.images.find(id)
      image.purge
    end
    redirect_to user_post_path(current_user, @post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(current_user)
  end

  private

  def post_strong_params
    params.require(:post).permit(:date, :description, :title, images: [])
  end
end
