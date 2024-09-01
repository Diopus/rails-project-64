# frozen_string_literal: true

require 'application_system_test_case'

class PostCommentsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:two)
    @root_comment = post_comments(:root_comment)
    @root_comment_child = post_comments(:root_comment_child)
    @user = users(:one)
  end

  test 'visiting a post and adding a comment' do
    sign_in @user
    visit post_url(@post)

    assert_selector 'h1', text: @post.title

    fill_in 'post_comment_content', with: @root_comment.content
    find('input[type="submit"]').click

    assert_text @root_comment.content
    assert_selector '.card-text', text: @root_comment.content
  end

  test 'adding a nested comment' do
    sign_in @user
    visit post_url(@post)

    fill_in 'post_comment_content', with: @root_comment.content
    find('input[type="submit"]').click
    assert_text @root_comment.content

    find('.text-decoration-underline.text-lowercase', text: I18n.t('posts.comment.add_comment')).click

    within('.collapse') do
      fill_in 'post_comment_content', with: @root_comment_child.content
      find('input[type="submit"]').click
    end

    assert_text @root_comment_child.content
    assert_selector '.card-text', text: @root_comment_child.content
  end

  private

  def sign_in(user)
    visit new_user_session_path
    fill_in I18n.t('activerecord.attributes.user.email'), with: user.email
    fill_in I18n.t('activerecord.attributes.user.password'), with: 'password'
    find('input[type="submit"]').click
  end
end
