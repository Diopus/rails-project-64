# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in(@user)
  end

  test '#create' do
    post = posts(:one)
    post post_likes_path(post)
    assert_response :redirect

    like = post.likes.find_by user: @user

    assert { like }
  end

  test '#destroy' do
    like = post_likes(:one)
    post = like.post
    delete post_like_path(post, like)

    assert_response :redirect
    assert_not post.likes.find_by user: @user
  end
end
