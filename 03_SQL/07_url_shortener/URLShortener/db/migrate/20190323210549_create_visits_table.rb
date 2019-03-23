class CreateVisitsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.integer :user_id, null: false
      t.integer :visited_url, null: false

      t.timestamps
    end
  end
end
