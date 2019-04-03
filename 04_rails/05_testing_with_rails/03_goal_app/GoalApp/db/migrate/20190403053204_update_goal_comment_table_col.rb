class UpdateGoalCommentTableCol < ActiveRecord::Migration[5.2]
  def change
    rename_column :goal_comments, :goal, :goal_id
  end
end
