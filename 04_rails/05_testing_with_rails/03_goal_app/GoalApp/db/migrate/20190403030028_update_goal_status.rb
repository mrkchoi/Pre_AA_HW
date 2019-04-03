class UpdateGoalStatus < ActiveRecord::Migration[5.2]
  def change
    change_column :goals, :completed, :string, null: false
  end
end
