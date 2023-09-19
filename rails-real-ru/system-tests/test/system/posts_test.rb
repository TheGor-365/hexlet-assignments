# frozen_string_literal: true

require 'application_system_test_case'

# BEGIN
class PostsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:one)
    @post_two = posts(:two)
    @post_without_comments = posts(:without_comments)
  end

  test 'visiting the index' do
    visit posts_url

    assert_selector 'h1', text: 'Posts'
  end

  test 'should create post' do
    visit posts_url
    click_on 'New Post'

    fill_in 'Title', with: @post.title
    fill_in 'Body', with: @post.body
    click_on 'Create Post'

    assert_text "Post was successfully created"
    take_screenshot
    click_on "Back"
  end

  test "should update post" do
    visit posts_url
    click_on "Edit", match: :first

    fill_in "Title", with: @post_two.title
    fill_in "Body", with: @post_two.body
    click_on "Update Post"

    assert_text "Post was successfully updated"
    click_on "Back"
  end

  test "should delete post" do
    visit posts_url
    click_on "Destroy", match: :first

    accept_alert do
      'Are you sure?'
    end
  end
end
# END
