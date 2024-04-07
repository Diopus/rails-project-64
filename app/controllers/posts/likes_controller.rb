# frozen_string_literal: true

class Posts::LikesController < Posts::ApplicationController
  def create
    @like = resource_post.likes.find_or_create_by(post: resource_post, user: current_user)

    redirect_to resource_post
  end

  def destroy
    like = resource_post.likes.find_by(user: current_user)
    like&.destroy!

    redirect_to resource_post
  end
end
