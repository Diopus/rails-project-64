# frozen_string_literal: true

class AddCreatorIdToPostComments < ActiveRecord::Migration[7.1]
  def change
    add_reference :post_comments, :creator, null: false, foreign_key: { to_table: :users }
  end
end
