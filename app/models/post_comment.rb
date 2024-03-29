# frozen_string_literal: true

class PostComment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_ancestry

  validates :content, presence: true, length: { minimum: 5, allow_blank: true }
end
