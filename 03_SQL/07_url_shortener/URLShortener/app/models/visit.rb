# == Schema Information
#
# Table name: visits
#
#  id             :bigint(8)        not null, primary key
#  user_id        :integer          not null
#  visited_url_id :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Visit < ApplicationRecord
  validates :user_id, :visited_url_id, presence: true

  belongs_to(
    :user,
      class_name: 'User',
      foreign_key: :user_id,
      primary_key: :id
  )

  belongs_to(
    :visited_url,
      class_name: 'ShortenedURL',
      foreign_key: :visited_url_id,
      primary_key: :id
  )

  def self.record_visit!(user, shortened_url)
    Visit.create!({
      user_id: user.id,
      visited_url_id: shortened_url.id
    })
  end
end
