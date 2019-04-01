class UpdateAlbumTypeColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :albums, :studio_album
    remove_column :tracks, :regular_track

    add_column :albums, :album_type, :string, default: 'Studio', null: false
    add_column :tracks, :track_type, :string, default: 'Regular', null: false
  end
end
