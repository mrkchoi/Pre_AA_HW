# == Schema Information
#
# Table name: albums
#
#  id           :bigint(8)        not null, primary key
#  title        :string           not null
#  year         :string           not null
#  studio_album :boolean          default(TRUE), not null
#  band_id      :string           not null
#

class Album < ApplicationRecord
  validates :title, :year, :studio_album, :band_id, presence: true  

  belongs_to(
    :band,
    class_name: 'Band',
    foreign_key: :band_id,
    primary_key: :id
  )
  
end
