# frozen_string_literal: true

require 'test_helper'

class PostCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @root_comment = post_comments(:root_comment)
    @root_comment_child = post_comments(:root_comment_child)
    @user = users(:one)
    sign_in(@user)
  end

  test '#create root comment' do
    assert_difference('PostComment.count') do
      comment_params = { post_comment: {
        content: @root_comment.content,
        post_id: @root_comment.post.id,
        user_id: @user.id
      } }
      post post_comments_path(@root_comment.post), params: comment_params
    end

    assert_redirected_to post_path(@root_comment.post)
  end

  test '#create child fot root comment' do
    assert_difference('PostComment.count') do
      comment_params = { post_comment: {
        content: @root_comment_child.content,
        post_id: @root_comment_child.post.id,
        parent: @root_comment,
        user_id: @user.id
      } }
      post post_comments_path(@root_comment.post), params: comment_params
    end

    assert_redirected_to post_path(@root_comment.post)
  end
end
