class AddIndicesToCommentsTables < ActiveRecord::Migration[5.2]
  def change
    add_index :user_comments, :author_id
    add_index :user_comments, :user_id

    add_index :goal_comments, :author_id
    add_index :goal_comments, :goal_id
  end
end
