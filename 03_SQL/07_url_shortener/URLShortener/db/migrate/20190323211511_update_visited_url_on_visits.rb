class UpdateVisitedUrlOnVisits < ActiveRecord::Migration[5.2]
  def change
    rename_column :visits, :visited_url, :visited_url_id
  end
end
