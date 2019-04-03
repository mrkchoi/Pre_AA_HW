class RenameColumnsComments < ActiveRecord::Migration[5.2]
  def change
    rename_column :goal_comments, :goal_content, :content
    rename_column :user_comments, :comment_content, :content
  end
end
