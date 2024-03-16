require "test_helper"

class PostCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @root_comment = post_comments(:root_comment)
    @root_comment_child = post_comments(:root_comment_child)
    @user = users(:one)
    sign_in(@user)
  end

  test "#create root comment" do
    assert_difference("PostComment.count") do
      post post_comments_path(@root_comment.post), params: { post_comment: { content: @root_comment.content, post_id: @root_comment.post.id, creator_id: @user.id } }
    end

    assert_redirected_to post_path(@root_comment.post)
  end

  test "#create child fot root comment" do
    assert_difference("PostComment.count") do
      post post_comments_path(@root_comment.post), params: { post_comment: { content: @root_comment_child.content, post_id: @root_comment_child.post.id, parent: @root_comment } }
    end

    assert_redirected_to post_path(@root_comment.post)
  end
end
