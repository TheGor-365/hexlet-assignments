# frozen_string_literal: true

require 'test_helper'

module Posts
  class CommentsControllerTest < ActionDispatch::IntegrationTest
    setup do
      @comment = post_comments(:one)
      # @post = post(:one)
    end

    test 'should get new' do
      @post = post(:one)

      get new_post_comment_path(@post)
      assert_response :success
    end

    test 'should create post_comment' do
      @post = post(:one)

      assert_difference("PostComment.count") do
        post post_comments_path(@post), params: {
          post_comment: {
            body:    @comment.body,
            post_id: @comment.post_id
          }
        }
      end

      assert_redirected_to post_url(@post)
    end

    test 'should show post_comment' do
      @post = post(:one)

      get post_path(@post)
      assert_response :success
    end

    test 'should get edit' do
      @post = post(:one)

      get edit_post_comment_path(@post, @comment)
      assert_response :success
    end

    test 'should update post_comment' do
      @post = post(:one)

      patch post_comment_path(@post), params: {
        post_comment: {
          body:    @comment.body,
          post_id: @comment.post_id
        }
      }
      assert_redirected_to post_url(@post)
    end

    test 'should destroy post_comment' do
      @post = post(:one)
      
      delete post_comment_path(@post, @comment)

      assert { !PostComment.exists?(@comment.id) }
      assert_redirected_to posts_url
    end
  end
end