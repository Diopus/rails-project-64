# frozen_string_literal: true

module SeedsHelper
  module_function

  def create_comment_replies(post, users, max_replies, parent_comment = nil)
    rand(0..max_replies).times do
      child_comment = post.comments.create!(
        content: Faker::Lorem.sentence,
        user: users.sample,
        parent: parent_comment
      )

      max_replies = [max_replies - rand(0..1), 0].max
      create_comment_replies(post, users, max_replies, child_comment)
    end
  end
end
