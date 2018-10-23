class PostsController < ApplicationController

  attr_accessor :post
  
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end


  def edit
    @post = Post.find(params[:id])
  end

  def delete
  end

  def create
    @post = Post.new
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  private

  def post_params
    params.permit(:title, :category, :content)
  end
end