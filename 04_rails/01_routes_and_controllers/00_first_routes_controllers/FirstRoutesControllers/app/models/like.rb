# == Schema Information
#
# Table name: likes
#
#  id            :bigint(8)        not null, primary key
#  likeable_type :string
#  likeable_id   :bigint(8)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Like < ApplicationRecord
  validates :likeable_type, presence: true
  validates :likeable_id, presence: true

  belongs_to :likeable, polymorphic: true
end
