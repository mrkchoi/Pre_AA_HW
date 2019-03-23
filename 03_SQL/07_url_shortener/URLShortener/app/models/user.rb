# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  has_many(
    :submitted_urls,
      class_name: 'ShortenedURL',
      foreign_key: :submitted_by_user_id,
      primary_key: :id
  )

  has_many(
      :visits,
        class_name: 'Visit',
        foreign_key: :user_id,
        primary_key: :id
  )

  has_many(
      :visited_urls,
      Proc.new { distinct },
        through: :visits,
        source: :visited_url
  )
end
