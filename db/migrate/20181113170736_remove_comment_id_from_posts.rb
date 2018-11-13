class RemoveCommentIdFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :comment_id, :integer
  end
end
