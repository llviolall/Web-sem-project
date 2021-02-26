# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :current_user, only: %i[index create my_posts]
  def new
    redirect_to signin_path unless current_user
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def index
    @post = Post.all
  end

  def create
    @post = Post.new(params_post)
    @post.author_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params_post) && @post.author_id = current_user.id
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_my_posts_path
  end

  def my_posts
    @my_posts = Post.all
  end

  private def params_post
    params.require(:post).permit(:title, :body)
  end
end
