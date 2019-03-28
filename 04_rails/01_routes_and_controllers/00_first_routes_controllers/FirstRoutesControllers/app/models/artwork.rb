# == Schema Information
#
# Table name: artworks
#
#  id        :bigint(8)        not null, primary key
#  artist_id :integer          not null
#  title     :string           not null
#  image_url :string           not null
#

class Artwork < ApplicationRecord
  validates :title, presence: true
  validates :image_url, presence: true
  validates :artist_id, presence: true
  validates :artist_id, uniqueness: { scope: :title,
    message: 'cannot submit artwork with duplicate titles!'
  }

  belongs_to(
    :artist,
    class_name: 'User',
    foreign_key: :artist_id,
    primary_key: :id
  )

  has_many(
    :artwork_shares,
    class_name: 'ArtworkShare',
    foreign_key: :artwork_id,
    primary_key: :id,
  )

  has_many(
    :shared_viewers,
    through: :artwork_shares,
    source: :viewer
  )

  has_many(
    :comments,
    class_name: 'Comment',
    foreign_key: :artwork_id,
    primary_key: :id,
    dependent: :destroy
  )

  has_many(
    :likes,
    as: :likeable
  )
end
