# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  breadcrumb I18n.t('loaf.breadcrumbs.home'), :root_path

  def index
    @posts = Post.preload(:creator).order(id: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @post_like_by_current_user = @post.likes.find_by(user: current_user) if current_user
    breadcrumb @post.category.name, post_path
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to post_path(@post), notice: I18n.t('posts.create.success')
    else
      flash.now[:alert] = I18n.t('posts.create.error')
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end
end
