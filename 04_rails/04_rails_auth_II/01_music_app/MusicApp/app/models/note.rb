# == Schema Information
#
# Table name: notes
#
#  id         :bigint(8)        not null, primary key
#  user_id    :integer          not null
#  track_id   :integer          not null
#  note_text  :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Note < ApplicationRecord
  validates :user_id, :track_id, :note_text, presence: true

  belongs_to(
    :user,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id
  )

  belongs_to(
    :track,
    class_name: 'Track',
    foreign_key: :track_id,
    primary_key: :id
  )
end
