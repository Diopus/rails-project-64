class AddPostLikesCountToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :post_likes_count, :integer, null: false, default: 0
  end
end
