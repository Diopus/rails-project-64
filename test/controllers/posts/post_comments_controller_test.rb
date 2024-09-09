# frozen_string_literal: true

require 'test_helper'

class PostCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @root_comment = post_comments(:root_comment)
    @user = users(:one)
    sign_in(@user)
  end

  test '#create root comment' do
    new_comment = { content: Faker::Lorem.paragraph }
    comment_params = { post_comment: new_comment }
    post post_comments_path(@post), params: comment_params

    assert_redirected_to post_path(@post)
    assert_equal new_comment[:content], @post.comments.last.content
  end

  test '#create child fot root comment' do
    post = @root_comment.post
    new_comment = {
      content: Faker::Lorem.paragraph,
      parent_id: @root_comment.id
    }
    comment_params = { post_comment: new_comment }
    post post_comments_path(post), params: comment_params

    assert_redirected_to post_path(post)

    comment_created = post.comments.find_by(content: new_comment[:content], user_id: @user.id)
    assert comment_created

    assert_equal comment_created.parent_id, @root_comment.id
  end
end
