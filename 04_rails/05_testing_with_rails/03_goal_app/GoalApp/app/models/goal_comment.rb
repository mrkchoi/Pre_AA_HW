# == Schema Information
#
# Table name: goal_comments
#
#  id         :bigint(8)        not null, primary key
#  author_id  :integer          not null
#  goal_id    :integer          not null
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GoalComment < ApplicationRecord
  validates :author_id, :goal_id, :content, presence: true

    belongs_to(
      :author,
      class_name: 'User',
      foreign_key: :author_id,
      primary_key: :id
    )

    belongs_to(
      :goal,
      class_name: 'Goal',
      foreign_key: :goal_id,
      primary_key: :id
    )
end
