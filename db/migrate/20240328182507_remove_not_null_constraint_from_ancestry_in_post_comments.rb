# frozen_string_literal: true

class RemoveNotNullConstraintFromAncestryInPostComments < ActiveRecord::Migration[7.1]
  def change
    change_column_null :post_comments, :ancestry, true
  end
end
