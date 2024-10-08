# frozen_string_literal: true

require 'application_system_test_case'

class PostsTest < ApplicationSystemTestCase
  setup do
    @category = categories(:one)
    @post = posts(:two)
    @user = users(:one)
  end

  test 'visiting the index' do
    sign_in @user

    visit root_url
    assert_selector 'h1', text: I18n.t('posts.index.title')
  end

  test 'should create post' do
    sign_in @user

    visit root_url
    assert_selector 'h1', text: I18n.t('posts.index.title'), wait: 7

    click_on I18n.t('layouts.nav.create_post')

    fill_in 'post_title', with: @post.title
    fill_in 'post_body', with: @post.body

    select @post.category.name, from: 'post_category_id'
    find('input[type="submit"]').click

    assert_text I18n.t('posts.create.success')
    assert_selector 'h1', text: @post.title
  end
end
