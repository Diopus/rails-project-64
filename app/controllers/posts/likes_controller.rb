class Posts::LikesController < Posts::ApplicationController
  def create
    @like = resource_post.likes.create(post: resource_post, user: current_user)
    # [TODO] if @like.persisted?

    redirect_to resource_post
  end

  def destroy
    like = resource_post.likes.find_by(user: current_user)
    like.destroy! if like
    # [TODO] message?..

    redirect_to resource_post
  end
end
