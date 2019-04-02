# == Schema Information
#
# Table name: albums
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  year       :string           not null
#  band_id    :string           not null
#  album_type :string           default("Studio"), not null
#

class Album < ApplicationRecord
  validates :title, :year, :album_type, :band_id, presence: true  

  belongs_to(
    :band,
    class_name: 'Band',
    foreign_key: :band_id,
    primary_key: :id
  )

  has_many(
    :tracks,
    class_name: 'Track',
    foreign_key: :album_id,
    primary_key: :id,
    dependent: :destroy
  )
  
end
