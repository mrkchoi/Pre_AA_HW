class CreateGoalsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.integer :user_id, null: false
      t.text :goal_content, null: false
      t.string :goal_type, null: false, default: 'public'
      t.boolean :completed, null: false, default: false
    end

    add_index :goals, :completed
    add_index :goals, :user_id
  end
end
