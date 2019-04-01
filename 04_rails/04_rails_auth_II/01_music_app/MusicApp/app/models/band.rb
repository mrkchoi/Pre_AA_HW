# == Schema Information
#
# Table name: bands
#
#  id         :bigint(8)        not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Band < ApplicationRecord
  validates :name, presence: true
  
  has_many(
    :albums,
    class_name: 'Album',
    foreign_key: :band_id,
    primary_key: :id,
    dependent: :destroy
  )

  has_many(
    :tracks,
    through: :albums,
    source: :tracks,
    dependent: :destroy
  )
  
end
