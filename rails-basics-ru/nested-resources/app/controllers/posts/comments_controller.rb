module Posts
  class CommentsController < ApplicationController
    before_action :set_post_comment, only: %i[ edit update destroy ]
    before_action :set_post, only: %i[ new edit create update destroy ]

    def new
      @post_comment = @post.post_comments.build
    end

    def edit; end

    def create
      @post_comment = @post.post_comments.build(post_comment_params)

      if @post_comment.save
        redirect_to post_url(@post), notice: "Comment was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @post_comment.update(post_comment_params)
        redirect_to post_url(@post), notice: "Comment was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @post_comment.destroy

      redirect_to post_path(@post), notice: 'Comment was successfully destroyed.'
    end

    private

    def set_post_comment
      @post_comment = PostComment.find(params[:id])
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

    def post_comment_params
      params.require(:post_comment).permit(:body, :post_id)
    end
  end
end
