# == Schema Information
#
# Table name: polls
#
#  id        :bigint(8)        not null, primary key
#  author_id :integer          not null
#  title     :string           not null
#

class Poll < ApplicationRecord
  validates :author_id, presence: true
  validates :presence, presence: true
  
  belongs_to(
    :author,
      class_name: 'User',
      foreign_key: :author_id,
      primary_key: :id
  )

  has_many(
    :questions,
      class_name: 'Question',
      foreign_key: :poll_id,
      primary_key: :id
  )
end
