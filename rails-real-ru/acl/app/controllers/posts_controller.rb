# frozen_string_literal: true

class PostsController < ApplicationController
  after_action :verify_authorized, except: %i[index show]
  before_action :set_post, only: %i[show edit update destroy]

  # BEGIN
  def index
    @posts = Post.all
    authorize @posts
  end

  def show; end

  def new
    if current_user
      @post = current_user&.posts.build
    else
      @post = Post.new
    end
    authorize @post
  end

  def edit; end

  def create
    if current_user
      @post = current_user&.posts.build(post_params)
    else
      @post = Post.new(post_params)
    end
    authorize @post

    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy

    redirect_to posts_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
    authorize @post
  end

  def post_params
    params.require(:post).permit(:title, :body, :author_id)
  end
  # END
end
