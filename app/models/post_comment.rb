# frozen_string_literal: true

class PostComment < ApplicationRecord
  MIN_CONTENT_LENGTH = 5

  belongs_to :post
  belongs_to :user
  has_ancestry

  validates :content, presence: true, length: { minimum: MIN_CONTENT_LENGTH, allow_blank: true }

  def self.min_content_length
    MIN_CONTENT_LENGTH
  end
end
