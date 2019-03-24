class CreateTagTopicsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_topics do |t|
      t.string :topic_name

      t.timestamps
    end
  end
end
