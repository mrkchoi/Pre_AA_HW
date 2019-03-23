class AddIndicesToVisitsTable < ActiveRecord::Migration[5.2]
  def change
    add_index :visits, :user_id
    add_index :visits, :visited_url
  end
end
