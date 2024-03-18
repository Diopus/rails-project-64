class LikesController < ApplicationController
  def create
    @like = resource_post.like.create(resource_answer, current_user)
    if @like.persisted?
      f(:success)
    else
      f(:error, errors: @like.errors.full_messages.to_sentence)
    end

    redirect_to resume_path(resource_answer.resume, anchor: "answer-#{resource_answer.id}")
  end

  def destroy
    like = resource_answer.likes.find_by! user: current_user
    like.destroy!
    f(:success)

    redirect_to resume_path(resource_answer.resume, anchor: "answer-#{resource_answer.id}")
  end
end
