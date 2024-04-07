# frozen_string_literal: true

class Posts::CommentsController < Posts::ApplicationController
  def create
    @post_comment = resource_post.comments.build(post_comment_params)
    @post_comment.user = current_user

    if @post_comment.save
      redirect_back fallback_location: post_path(resource_post), notice: I18n.t('posts.comments.create.success')
    else
      redirect_back fallback_location: post_path(resource_post), alert: @post_comment.errors.full_messages.join(', ')
    end
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:content, :parent_id)
  end
end
