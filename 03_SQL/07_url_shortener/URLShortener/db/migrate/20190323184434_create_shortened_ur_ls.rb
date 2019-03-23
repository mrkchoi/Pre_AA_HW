class CreateShortenedUrLs < ActiveRecord::Migration[5.2]
  def change
    create_table :shortened_urls do |t|
      t.string :long_url
      t.string :short_url
      t.integer :submitted_by_user_id
      
      t.timestamps
    end

    add_index :shortened_urls, :submitted_by_user_id
    add_index :shortened_urls, :short_url, unique: true
  end
end
