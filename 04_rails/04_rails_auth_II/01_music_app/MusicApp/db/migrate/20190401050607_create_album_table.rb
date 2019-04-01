class CreateAlbumTable < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.string :year, null: false
      t.boolean :studio_album, null: false, default: true
      t.string :band_id, null: false
    end

    add_index :albums, :band_id
    add_index :albums, :title
  end
end
