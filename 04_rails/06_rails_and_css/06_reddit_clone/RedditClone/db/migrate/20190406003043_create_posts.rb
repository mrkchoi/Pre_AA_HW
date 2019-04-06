class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :url
      t.text :content
      t.integer :author_id, null: false, index: true
      t.integer :sub_id, null: false, index: true
    end

    add_index :posts, [:author_id, :sub_id]
  end
end
