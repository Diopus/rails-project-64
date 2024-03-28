# frozen_string_literal: true

class Post < ApplicationRecord
  MIN_TITLE_LENGTH = 5
  MAX_TITLE_LENGTH = 255
  MIN_BODY_LENGTH = 200
  MAX_BODY_LENGTH = 4000

  belongs_to :category
  belongs_to :creator, class_name: 'User'
  has_many :comments, dependent: :destroy, class_name: 'PostComment'
  has_many :likes, dependent: :destroy, inverse_of: :post, class_name: 'PostLike'

  validates :title, presence: true, length: { minimum: MIN_TITLE_LENGTH, maximum: MAX_TITLE_LENGTH }
  validates :body, presence: true, length: { minimum: MIN_BODY_LENGTH, maximum: MAX_BODY_LENGTH }
end
