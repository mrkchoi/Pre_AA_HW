class AddIndexToTaggingTable2 < ActiveRecord::Migration[5.2]
  def change
    add_index :taggings, :url_id
    add_index :taggings, :topic_id
  end
end
