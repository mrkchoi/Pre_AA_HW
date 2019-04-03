class CreateGoalCommentTable < ActiveRecord::Migration[5.2]
  def change
    create_table :goal_comments do |t|
      t.integer :author_id, null: false
      t.integer :goal_id, null: false
      t.text :goal_content, null: false

      t.timestamps
    end
  end
end
