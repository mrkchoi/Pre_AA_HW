# == Schema Information
#
# Table name: taggings
#
#  id         :bigint(8)        not null, primary key
#  url_id     :integer          not null
#  topic_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tagging < ApplicationRecord
  # create validations
  validates :url_id, :topic_id, presence: true
  # create associations
  belongs_to(
    :topics,
      class_name: 'TagTopic',
      foreign_key: :topic_id,
      primary_key: :id
  )

  belongs_to(
    :tagged_urls,
      class_name: 'ShortenedURL',
      foreign_key: :url_id,
      primary_key: :id,
  )

end


