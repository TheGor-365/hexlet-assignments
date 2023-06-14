# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = post_comments(:one)
    @post = post(:one)
  end

  test 'should get new' do
    get new_post_comment_url
    assert_response :success
  end

  test 'should create comment' do
    assert_difference("PostComment.count") do
      post post_comments_url(@post), params: {
        post_comment: {
          body:    @comment.body,
          post_id: @comment.post_id
        }
      }
    end

    assert_redirected_to post_url(@post)
  end

  test 'should show comment' do
    get post_url(@post)
    assert_response :success
  end

  test 'should get edit' do
    get edit_post_comment(@post, @comment)
    assert_response :success
  end

  test 'should update post' do
    patch post_comment_path(@post), params: {
      post_comment: {
        body:    @comment.body,
        post_id: @comment.post_id
      }

    @comment.body = 'Updated body'

    assert { @comment.body == 'Updated body' }
    assert_redirected_to post_url(@post)
  end

  test 'should destroy comment' do
    delete post_comment(@post, @comment)

    assert { !PostComment.exists?(@comment.id) }
    assert_redirected_to posts_url
  end
end
