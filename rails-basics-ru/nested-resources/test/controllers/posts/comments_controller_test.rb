# frozen_string_literal: true

require 'test_helper'

module Posts
  class CommentsControllerTest < ActionDispatch::IntegrationTest
    setup do
      @comment = post_comments(:one)
    end

    test 'should create post_comment' do
      assert_difference('PostComment.count') do
        post post_comments_path(@comment), params: {
          post_comment: {
            body: @comment.body,
            post_id: @comment.post_id
          }
        }
      end

      assert_redirected_to post_url(@comment)
    end

    test 'should get edit' do
      get edit_post_comment_path(@comment)
      assert_response :success
    end

    test 'should update post_comment' do
      patch post_comment_path(@comment)
      assert_redirected_to post_url(@comment)
    end

    test 'should destroy post_comment' do
      delete post_comment_path(@comment)
      assert_difference("PostComment.count", -1) do
        delete post_comment_path(@comment)
      end
      assert_redirected_to posts_url
    end
  end
end
