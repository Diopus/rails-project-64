# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)
    @post = posts(:one)
    @user = users(:one)
    sign_in(@user)
  end

  test '#index' do
    get root_path
    assert_response :success
  end

  test '#new' do
    get new_post_path
    assert_response :success
  end

  test '#create' do
    title_length = rand(Post.title_length_range)
    body_length = rand(Post.body_length_range)
    new_post = {
      title: Faker::Lorem.paragraph_by_chars(number: title_length),
      body: Faker::Lorem.paragraph_by_chars(number: body_length),
      category_id: @category.id
    }
    post_params = { post: new_post }
    post posts_path, params: post_params

    assert_redirected_to post_path(Post.last)
    assert_equal new_post[:body], Post.last.body
  end

  test '#show' do
    get post_path(@post)
    assert_response :success
  end
end
