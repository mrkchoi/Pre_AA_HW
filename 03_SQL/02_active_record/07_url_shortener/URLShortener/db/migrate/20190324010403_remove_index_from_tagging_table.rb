class RemoveIndexFromTaggingTable < ActiveRecord::Migration[5.2]
  def change
    remove_index :taggings, :url_id
    remove_index :taggings, :topic_id
  end
end
