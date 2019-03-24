class ChangeTopicNameColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :tag_topics, :topic_name, :name
  end
end
