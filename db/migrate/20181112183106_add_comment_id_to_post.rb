class AddCommentIdToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :comment_id, :integer
  end
end
