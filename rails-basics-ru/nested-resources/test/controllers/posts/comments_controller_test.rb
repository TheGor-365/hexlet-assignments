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
  end
end
