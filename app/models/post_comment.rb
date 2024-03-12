class PostComment < ApplicationRecord
  belongs_to :post
  belongs_to :creator, class_name: 'User'
  has_ancestry
end
