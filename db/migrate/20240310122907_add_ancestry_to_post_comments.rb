# frozen_string_literal: true

class AddAncestryToPostComments < ActiveRecord::Migration[7.1]
  def change
    change_table(:post_comments) do |t|
      t.string 'ancestry', null: false
      t.index 'ancestry'

      unless ActiveRecord::Base.connection.adapter_name.downcase.include?('sqlite')
        if ActiveRecord::Base.connection.adapter_name.downcase.include?('postgresql')
          t.string 'ancestry', collation: 'C', null: false
        elsif ActiveRecord::Base.connection.adapter_name.downcase.include?('mysql')
          t.string 'ancestry', collation: 'utf8mb4_bin', null: false
        end
      end
    end
  end
end
