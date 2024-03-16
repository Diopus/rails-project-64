require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category =categories(:one)
    @post = posts(:one)
    @user = users(:one)
    sign_in(@user)
  end

  test "#index" do
    get posts_path
    assert_response :success
  end

  test "#new" do
    get new_post_path
    assert_response :success
  end

  test "#create" do
    assert_difference("Post.count") do
      post posts_path, params: { post: { body: @post.body, category_id: @category.id, creator_id: @user.id, title: @post.title } }
    end

    assert_redirected_to post_path(Post.last)
  end

  test "#show" do
    get post_path(@post)
    assert_response :success
  end
end
