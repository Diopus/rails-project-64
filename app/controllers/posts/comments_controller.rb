class Posts::CommentsController < Posts::ApplicationController
  def create
    @post_comment = resource_post.comments.build(post_comment_params)
    @post_comment.creator = current_user

    respond_to do |format|
      if @post_comment.save
        format.html { redirect_back fallback_location: post_path(resource_post), notice: I18n.t('posts.comments.create.success') }
        format.json { render json: @post_comment, status: :created, location: @post_comment }
      else
        format.html { redirect_back fallback_location: post_path(resource_post), alert: @post_comment.errors.full_messages.join(', ') }
        format.json { render json: @post_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:content, :parent_id)
  end
end
