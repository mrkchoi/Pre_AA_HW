# == Schema Information
#
# Table name: users
#
#  id       :bigint(8)        not null, primary key
#  username :string           not null
#

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many(
    :artworks,
    class_name: 'Artwork',
    foreign_key: :artist_id,
    primary_key: :id,
    dependent: :destroy
  )

  has_many(
    :artwork_shares,
    class_name: 'ArtworkShare',
    foreign_key: :viewer_id,
    primary_key: :id,
    dependent: :destroy
  )
  
  has_many(
    :shared_artworks,
    through: :artwork_shares,
    source: :artwork
  )

  has_many(
    :comments,
    class_name: 'Comment',
    foreign_key: :user_id,
    primary_key: :id,
    dependent: :destroy
  )

  def liked_comments
    likes = []
    comments.each do |comment|
      comment.likes
    end
  end

  def liked_artworks
    likes = []
    artworks.each do |artwork|
      artwork.likes
    end
  end

end
