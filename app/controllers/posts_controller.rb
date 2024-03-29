# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  breadcrumb I18n.t('loaf.breadcrumbs.home'), :root_path

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    breadcrumb @post.category.name, post_path
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_path(@post), notice: I18n.t('posts.create.success') }
        format.json { render :show, status: :created, location: @post }
      else
        format.html do
          flash.now[:alert] = I18n.t('posts.create.error')
          render :new, status: :unprocessable_entity
        end
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :creator_id, :category_id)
  end
end
