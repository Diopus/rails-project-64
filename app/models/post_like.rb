class PostLike < ApplicationRecord
  validates :post, uniqueness: { scope: %i[user] }

  belongs_to :post, inverse_of: :likes, counter_cache: true
  belongs_to :user
end
