# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  after_action :verify_authorized, except: %i[index show]

  # BEGIN
  def index
    @posts = Post.all
    authorize @posts
  end

  def show
  end

  def new
    @post = @user.posts.build
    authorize @posts
  end

  def edit
  end

  def create
    @post = @user.posts.build(post_params)

    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post
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
